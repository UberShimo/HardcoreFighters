logic_time = object_time * global.game_time;

image_speed = logic_time;

// is_projectile logic
if(is_projectile){
	if(!place_meeting(x+h_velocity*logic_time, y+v_velocity*logic_time, Parent_Collision)){
		x += h_velocity*logic_time;
		y += v_velocity*logic_time;
	}
	else{
		dir = point_direction(0, 0, h_velocity, v_velocity);
		x_check = lengthdir_x(2, dir);
		y_check = lengthdir_y(2, dir);
		
		while(!place_meeting(x, y, Parent_Collision)){
			x += x_check;
			y += y_check;
		}
	}
	v_velocity += weight*logic_time;
}
// Melee logic
else if(active_frames > 0){
	active_frames -= spawner.logic_time;
	
	if(spawner.action != spawner_action
	|| active_frames <= 0
	|| spawner.sprite_index == spawner.land_spr){
		instance_destroy();
	}
}

// Time reset Alarm
if(time_reset_alarm > 0){
	time_reset_alarm -= global.game_time;
	
	if(time_reset_alarm <= 0){
		time_reset_alarm = 0;
		
		object_time = 1;
		shake_amount = 0;
	}
}