logic_time = object_time*global.game_time;

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
#endregion

#region physics V-----V
// H velocity
val = h_velocity*logic_time;
x_check = val;
if(val > 0){
	x_check += (character_width/2);
}
else{
	x_check -= (character_width/2);
}

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
		action = "land";
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

#region dashy moves V-----V
// Dash
if(lb_pressed > 0 && (action == noone || check_for_cancel())){
	read_input();
	lb_pressed = 0; // Just reset LB buffer
	
	if(grounded){
		if(backward_hold){
			sprite_index = dash_backward_spr;
			h_velocity = -dash_speed*image_xscale;
			x += -dash_blink*image_xscale;
		}
		else{
			sprite_index = dash_forward_spr;
			h_velocity = dash_speed*image_xscale;
			x += dash_blink*image_xscale;
			meter += 2;
		}
	
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
			x += -dash_blink*image_xscale;
		}
		else{
			sprite_index = dash_forward_spr;
			h_velocity = dash_speed*image_xscale;
			x += dash_blink*image_xscale;
			meter += 2;
		}
	
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
#endregion

life_span -= logic_time;

if(life_span <= 0){
	instance_create_depth(x, y, 0, Eff_Clone_Dissapear);
	instance_destroy();
}