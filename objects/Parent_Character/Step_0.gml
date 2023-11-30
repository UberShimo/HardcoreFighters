logic_time = object_time * global.game_time;

ground_check = (character_height/2)+1;

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
		is_invincible = false;
		
		can_cancel = false;
	}
}

if(time_reset_alarm > 0){
	time_reset_alarm -= global.game_time;
	
	if(time_reset_alarm <= 0){
		time_reset_alarm = 0;
		
		object_time = 1;
		shake_amount = 0;
	}
}

if(respawn_alarm > 0){
	respawn_alarm -= global.game_time;
	
	if(respawn_alarm <= 0){
		respawn_alarm = 0;
		
		visible = true;
		is_controllable = true;
		is_respawning = false;
		is_invincible = true;
		alarm[0] = 120; // Invincibility reset
		
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
		HP = 100;
		meter = 0;
	}
}
#endregion

if(!is_respawning){
	
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
		meter += 10/60; // 10 meter / second
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
// Suicide
if(start_hold){
	surrender_count += 1;
	if(surrender_count >= 180){
		HP = 0;
		hearts = 0;
		att = instance_create_depth(x, y, 0, Obj_Suicide_Shockwave_hitbox);
		att.initiate(self);
		att.index = -1;
	}
}
else{
	surrender_count = 0;
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
	if(action == "launched"){
		h_velocity = -h_velocity/2;
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
	v_velocity = 0;
	
	// Land
	if(action != noone){
		sprite_index = land_spr;
		if(action_alarm > 0){
			recover_alarm = action_alarm;
			action_alarm = 0;
		}
	}
}
// Grounded or not? also reset cancels
if(position_meeting(x, y+ground_check, Parent_Collision)){
	grounded = true;
	
	if(action == noone){
		cancels = 2;
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
else if(action == "launched" && !grounded){
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
// Dash
if(lb_pressed > 0 && (action == noone || check_for_cancel())){
	read_input();
	lb_pressed = 0; // Just reset LB buffer
	
	if(grounded){
		if(backward_hold){
			sprite_index = dash_backward_spr;
			h_velocity = -dash_speed*image_xscale;
			blink_h(-dash_blink*image_xscale);
		}
		else{
			sprite_index = dash_forward_spr;
			h_velocity = dash_speed*image_xscale;
			blink_h(dash_blink*image_xscale);
			meter += 2;
		}
		image_index = 0;
	
		if(recover_alarm > 0){
			cancels -= 1;
			// Cancel eff
			eff = instance_create_depth(x, y, 1, Eff_Cancel);
			eff.initiate(self);
		}
	
		action = "dash";
		can_cancel = true;
		is_collidable = false;
		grip = dash_grip;
		air_grip = dash_grip;
		v_velocity = 0;
		weight = original_weight/4;
		recover_alarm = dash_duration;
	}
	// Air dash
	else if(cancels > 0){
		if(backward_hold){
			sprite_index = dash_backward_spr;
			h_velocity = -dash_speed*image_xscale;
			blink_h(-dash_blink*image_xscale);
		}
		else{
			sprite_index = dash_forward_spr;
			h_velocity = dash_speed*image_xscale;
			blink_h(dash_blink*image_xscale);
			meter += 2;
		}
		image_index = 0;
	
		// Air dash always counts as a cancel
		cancels -= 1;
		// Cancel eff
		eff = instance_create_depth(x, y, 1, Eff_Cancel);
		eff.initiate(self);
	
		action = "dash";
		can_cancel = true;
		is_collidable = false;
		grip = dash_grip;
		air_grip = dash_grip;
		v_velocity = 0;
		weight = original_weight/4;
		recover_alarm = dash_duration;
	}
}
// Force dash
if(lb_pressed && rb_pressed && meter >= 25){
	read_input();
	reset_buffers();
	meter -= 25;
	cancels = 0;
	
	if(backward_hold){
		sprite_index = dash_backward_spr;
		h_velocity = -dash_speed*image_xscale;
		blink_h(-dash_blink*image_xscale);
	}
	else{
		sprite_index = dash_forward_spr;
		h_velocity = dash_speed*image_xscale;
		blink_h(dash_blink*image_xscale);
	}
	image_index = 0;
	
	// Cancel eff
	eff = instance_create_depth(x, y, 1, Eff_Cancel);
	eff.initiate(self);
	
	action = "force dash";
	is_collidable = false;
	is_invincible = true;
	grip = dash_grip;
	air_grip = dash_grip;
	v_velocity = 0;
	weight = original_weight/4;
	action_alarm = 0;
	recover_alarm = 24;
}
// Block
if(grounded && (lt_hold || rt_hold)){
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

// Fully charged
if(meter == 100){
	eff = instance_create_depth(x, y, 1, Eff_Spark);
	eff.image_blend = c_lime;
	eff.image_xscale *= random_range(1, 2);
}

}
// Is respawning
else{
	visible = false;
	is_controllable = false;
	is_respawning = true;
}