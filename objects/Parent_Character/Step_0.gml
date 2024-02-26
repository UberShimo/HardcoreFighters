event_inherited();

if(is_respawning){
	visible = false;
	x = Obj_Respawner.x;
	y = Obj_Respawner.y;
	h_velocity = 0;
	v_velocity = 0;
}

ground_check = (character_height/2)+1;// +1 couse it works ok?

#region alarms  V-----V
if(action_alarm > 0){
	action_alarm -= logic_time;
	
	if(action_alarm <= 0){
		action_trigger();
	}
}

if(recover_alarm > 0){
	recover_alarm -= logic_time;
	
	if(recover_alarm <= 0){
		recover_alarm = 0;
		
		action = noone;
		sprite_index = stand_spr;
		
		reset_physics()
		is_unstoppable = false;
		
		can_cancel = false;
	}
}

if(death_alarm > 0){
	death_alarm -= global.game_time;
	
	if(death_alarm <= 0){
		death_alarm = 0;
		
		hearts -= 1;
		// Blood / respawn effect
		spawn_effect(x, y, 12, Eff_Blood, 1, 0.05, 4);
		eff = instance_create_depth(x, y, -1, Eff_Ring);
		eff.grow *= 4;
		eff.image_blend = c_red;
		
		if(hearts > 0){
			respawn_alarm = 120;
			is_controllable = false;
			is_invincible = true;
			is_respawning = true;
		}
		
		Obj_Match_Manager.check_for_winner();
	}	
}

if(respawn_alarm > 0){
	respawn_alarm -= global.game_time;
	
	if(respawn_alarm <= 0){
		respawn_alarm = 0;
		is_respawning = false;
		
		visible = true;
		is_controllable = true;
		is_invincible = true;
		invincibility_alarm = 120;
		
		reset_physics();
		face_closest_enemy();
		read_input();
		if(forward_hold){
			h_velocity = 4*image_xscale;
			v_velocity = -4;
		}
		else if(backward_hold){
			h_velocity = -4*image_xscale;
			v_velocity = -4;
		}
		HP = max_HP;
		meter /= 2; // Loose half meter
	}
}

if(invincibility_alarm > 0){
	invincibility_alarm -= logic_time;
	
	if(invincibility_alarm <= 0){
		invincibility_alarm = 0;
		
		is_invincible = false;
	}
}
#endregion

#region control V-----V
// Movement
if(action == noone && grounded && !is_blocking){
	
	// Crouch
	if(down_hold){
		// nothing lol
	}
	// Forward
	else if(forward_hold){
		if(abs(h_velocity) < start_speed){
			h_velocity = start_speed*image_xscale;
		}
		if(abs(h_velocity) < max_speed){
			h_velocity += (grip+acceleration)*image_xscale*logic_time;
		}
		// Gain meter by moving forward
		meter += 10/60*logic_time; // 10 meter / second
	}
	// Backward
	else if(backward_hold){
		if(abs(h_velocity) < start_speed){
			h_velocity = -start_speed*image_xscale;
		}
		if(abs(h_velocity) < max_speed){
			h_velocity += -(grip+acceleration)*image_xscale*logic_time;
		}
	}
	// Jump
	if(a_pressed){
		reset_physics();
		a_pressed = 0; // Just reset A buffer
		v_velocity = -jump_power;
	}	
}
// Extra jump / Jump cancel
else if(a_pressed && extra_jumps_left > 0 && (action == noone || check_for_cancel())){
	reset_physics();
	a_pressed = 0; // Just reset A buffer
	
	if(grounded){
		v_velocity = -jump_power;
	}
	else{
		extra_jumps_left -= 1;
		v_velocity = -jump_power*extra_jump_strength;
	}
	
	if(forward_hold){
		h_velocity = start_speed*image_xscale;
	}
	else if(backward_hold){
		h_velocity = -start_speed*image_xscale;
	}
	else{
		h_velocity = 0;
	}
	
	// Cancel
	if(recover_alarm > 0){
		cancels -= 1;
		action = noone;
		// Cancel eff
		eff = instance_create_depth(x, y, 1, Eff_Cancel);
		eff.initiate(self);
		
		recover_alarm = 0;
	}
}
// Short jump
if(action == noone && v_velocity < -jump_power*mini_jump_power && !a_hold){
	v_velocity = -jump_power*mini_jump_power;
}
// Exit
if(start_hold){
	exit_count += 1;
	if(exit_count >= exit_count_goal){
		room_goto(global.character_select);
	}
}
else{
	exit_count = 0;
}
#endregion

#region physics V-----V
// H velocity
val = h_velocity*logic_time;
x_check = val;
// Add character width to x_check
if(val > 0){
	x_check += (character_width/2);
}
else{
	x_check -= (character_width/2);
}
// Move time
if(!position_meeting(x+x_check, y, Parent_Collision)){
	x += val;
}
// Collide logic
else{
	while(!position_meeting(x+x_check, y, Parent_Collision)){
		if(val > 0){
			x += 1;
		}
		else{
			x -= 1;
		}
	}
	// Wall bounce
	if(action == "launched" && abs(h_velocity) > wall_bounce_limit){
		h_velocity = -h_velocity*0.75;
		v_velocity -= 4;
		spawn_effect(x, y, 8, Eff_Splash, 1, 0.05, 1);
	}
}

// Grip logic
val = grip*logic_time;
if(!grounded){
	val = air_grip*logic_time;
}

if(h_velocity > val){
	h_velocity -= val;
}
else if(h_velocity < -val){
	h_velocity += val;
}
else{
	h_velocity = 0;
}

// V velocity
val = v_velocity*logic_time;
if(!position_meeting(x, y+ground_check+val, Parent_Collision)){
	y += val;
	
	// Gravity
	if(!grounded && v_velocity < max_fall_speed){
		val = weight*logic_time;
		
		// Just to add some float
		if(abs(v_velocity) < jump_power/8){
			val /= 2;
		}
		v_velocity += val;
	}
	
}
// Snap to ground
else if(v_velocity > 0){
	y = floor(y);
	while(!position_meeting(x, y+ground_check, Parent_Collision)){
		y += 1;
	}
	// Ground bounce
	if(action == "launched" && v_velocity > ground_bounce_limit){
		v_velocity = -v_velocity*0.5;
		spawn_effect(x, y, 8, Eff_Splash, 1, 0.05, 1);
	}
	// Land
	else{
		v_velocity = 0;
	
		// Harsh land
		if(action != noone){
			sprite_index = land_spr;
			if(action_alarm > 0){
				recover_alarm = action_alarm;
				action_alarm = 0;
			}
		}
	}
}
// Grounded or not? also reset cancels
if(position_meeting(x, y+ground_check, Parent_Collision)){
	grounded = true;
	
	if(action == noone){
		cancels = max_cancels;
		extra_jumps_left = extra_jumps;
	}
}
else{
	grounded = false;
}
#endregion

#region sprite fix  V-----V
image_speed = logic_time;
image_angle = 0;

if(action == noone){
	if(grounded){
		face_closest_enemy();
		
		if(down_hold){
			sprite_index = crouch_spr;
		}
		else if(forward_hold){
			sprite_index = forward_spr;
		}
		else if(backward_hold){
			sprite_index = backward_spr;
		}
		else{
			sprite_index = stand_spr;
		}
		
		// Blocking sprites
		if(is_blocking){
			sprite_index = block_spr;
			if(down_hold){
				sprite_index = crouch_block_spr;
			}
			
			if(rt_hold){
				image_xscale = 1;
			}
			else{
				image_xscale = -1;
			}
		}
	}
	else{
		if(v_velocity < 0){
			sprite_index = ascend_spr;
		}
		else{
			sprite_index = descend_spr;
		}
	}
}
else if(action == "Launched" && !grounded){
	sprite_index = launched_spr;
	image_xscale = -1;
	image_angle = point_direction(0, 0, h_velocity, v_velocity);
	image_angle -= 90; // Rotate image correctly
		
	if(h_velocity < 0){ // face right
		image_xscale = 1;
	}
}
#endregion

#region buffer subtraction V-----V
forward_pressed--;
down_pressed--;
backward_pressed--;
a_pressed--;
b_pressed--;
x_pressed--;
y_pressed--;
lb_pressed--;
rb_pressed--;
down_forward_pressed--;
forward_down_pressed--;
half_circle_forward_pressed--;
down_backward_pressed--;
backward_down_pressed--;
half_circle_backward_pressed--;
#endregion

#region universal moves V-----V
// Meter dash
if((action == "Stunned" || action == "Launched") && lb_pressed > 0 && rb_pressed > 0 && meter >= 25){
	read_input();
	reset_buffers();
	meter -= 25;
	cancels = 0;
	
	if(backward_hold){
		sprite_index = dash_backward_spr;
		h_velocity = -dash_speed*image_xscale;
		blink_h(-dash_blink*image_xscale, true);
	}
	else{
		sprite_index = dash_forward_spr;
		h_velocity = dash_speed*image_xscale;
		blink_h(dash_blink*image_xscale, true);
	}
	image_index = 0;
	
	// Cancel eff
	eff = instance_create_depth(x, y, 1, Eff_Cancel);
	eff.initiate(self);
	
	action = "Meter Dash";
	is_collidable = false;
	is_invincible = true;
	grip = dash_grip;
	air_grip = dash_grip;
	v_velocity = dash_lift;
	weight = original_weight/4;
	action_alarm = 0;
	recover_alarm = 24;
	invincibility_alarm = 24;
}
// Normal Dash
if(lb_pressed > 0 && (action == noone || check_for_cancel())){
	read_input();
	lb_pressed = 0; // Just reset LB buffer
	
	if(grounded){
		if(backward_hold){
			sprite_index = dash_backward_spr;
			h_velocity = -dash_speed*image_xscale;
			blink_h(-dash_blink*image_xscale, true);
		}
		else{
			sprite_index = dash_forward_spr;
			h_velocity = dash_speed*image_xscale;
			blink_h(dash_blink*image_xscale, true);
			meter += 2;
		}
		image_index = 0;
	
		if(recover_alarm > 0){
			cancels -= 1;
			// Cancel eff
			eff = instance_create_depth(x, y, 1, Eff_Cancel);
			eff.initiate(self);
		}
	
		action = "Dash";
		can_cancel = true;
		is_collidable = false;
		grip = dash_grip;
		air_grip = dash_grip;
		v_velocity = dash_lift;
		weight = original_weight/4;
		recover_alarm = dash_duration;
	}
	// Air dash
	else if(cancels > 0){
		if(backward_hold){
			sprite_index = dash_backward_spr;
			h_velocity = -dash_speed*image_xscale;
			blink_h(-dash_blink*image_xscale, true);
		}
		else{
			sprite_index = dash_forward_spr;
			h_velocity = dash_speed*image_xscale;
			blink_h(dash_blink*image_xscale, true);
			meter += 2;
		}
		image_index = 0;
	
		// Air dash always counts as a cancel
		cancels -= 1;
		// Cancel eff
		eff = instance_create_depth(x, y, 1, Eff_Cancel);
		eff.initiate(self);
	
		action = "Dash";
		can_cancel = true;
		is_collidable = false;
		grip = dash_grip;
		air_grip = dash_grip;
		v_velocity = dash_lift;
		weight = original_weight/4;
		recover_alarm = dash_duration;
	}
}
// Block
if(grounded && action == noone && (lt_hold || rt_hold)){
	is_blocking = true;
}
else{
	is_blocking = false;
}
// Meter control
if(meter > max_meter){
	meter = max_meter;
}
#endregion

// Fully charged effect
if(meter == 100 && effect_counter >= 1){
	eff = instance_create_depth(x, y, 1, Eff_Spark);
	eff.image_blend = c_lime;
	eff.image_xscale *= random_range(1, 2);
}
