logic_time = object_time * global.game_time;

image_speed = logic_time;

// is_projectile logic
if(is_projectile){
	if(!place_meeting(x+h_velocity, y+v_velocity, Parent_Collision)){
		x += h_velocity;
		y += v_velocity;
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
	v_velocity += weight;
}
// Melee logic
else if(active_frames > 0){
	active_frames -= spawner.logic_time;
	
	if(spawner.action != spawner_action
	|| active_frames <= 0){
		instance_destroy();
	}
}

