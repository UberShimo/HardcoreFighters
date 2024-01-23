event_inherited();

if(spawner != noone){
	// Distance logic
	if(distance_to_point(spawner.x, spawner.y) > distance_range){
		dir = point_direction(x, y, spawner.x, spawner.y);
		acc = acceleration;
		
		if(distance_to_point(spawner.x, spawner.y) > 32){
			acc *= 4;
		}
		
		h_velocity += lengthdir_x(acc, dir);
		v_velocity += lengthdir_y(acc, dir);
		
		if(h_velocity > 0 && x > spawner.x){
			h_velocity -= distance_friction;
		}
		else if(h_velocity < 0 && x < spawner.x){
			h_velocity += distance_friction;
		}
		if(v_velocity > 0 && y > spawner.y){
			v_velocity -= distance_friction;
		}
		else if(v_velocity < 0 && y < spawner.y){
			v_velocity += distance_friction;
		}
	}
	// Close logic
	else{
		if(point_distance(x, y, h_velocity, v_velocity) > close_max_speed){
			h_velocity = lengthdir_x(close_max_speed, dir);
			v_velocity = lengthdir_y(close_max_speed, dir);
		}
	}
}
else{
	h_velocity = 0;
	v_velocity = 0;
}

x += h_velocity*logic_time;
y += v_velocity*logic_time;