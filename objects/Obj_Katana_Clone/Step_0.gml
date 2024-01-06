event_inherited();

ground_check = (character_height/2)+1;

#region alarms  V-----V
if(action_alarm > 0){
	action_alarm -= logic_time;
	
	if(action_alarm <= 0){
		action_trigger();
	}
}

if(time_reset_alarm > 0){
	time_reset_alarm -= global.game_time;
	
	if(time_reset_alarm <= 0){
		time_reset_alarm = 0;
		
		object_time = 1;
		shake_amount = 0;
		priority_struck = false;
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
	if(!grounded){
		val = weight*logic_time;
		// Clone float
		val /= 2;
		
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
}
else{
	grounded = false;
}
#endregion

#region dashy moves V-----V
// Dash
if(lb_pressed && (action == noone || check_for_cancel())){
	lb_pressed = false; // Just reset LB buffer
	
	if(grounded){
		sprite_index = dash_forward_spr;
		h_velocity = dash_speed*image_xscale;
		x += dash_blink*image_xscale;
	
		action = "dash";
		grip = dash_grip;
		air_grip = dash_grip;
		v_velocity = 0;
		weight = weight/4;
	}
	// Air dash
	else{
		sprite_index = dash_forward_spr;
		h_velocity = dash_speed*image_xscale;
		x += dash_blink*image_xscale;
	
		action = "dash";
		grip = dash_grip;
		air_grip = dash_grip;
		v_velocity = 0;
		weight = weight/4;
	}
}
#endregion


if(life_span > 0){
	life_span -= logic_time;
	
	if(life_span <= 0){
		instance_create_depth(x, y, 0, Eff_Clone_Dissapear);
		instance_destroy();
	}
}

// Fully charged
if(meter == 100){
	eff = instance_create_depth(x, y, 1, Eff_Spark);
	eff.image_blend = c_lime;
	eff.image_xscale *= random_range(1, 2);
}