event_inherited();

hitbox_alarm -= logic_time;
can_be_cought_alarm -= logic_time;

if(hitbox_alarm <= 0){
	hitbox_alarm = hitbox_frequency;
	
	hitbox = instance_create_depth(x, y, depth, Obj_Bow_Boomerang_hitbox);
	hitbox.initiate(spawner);
}

if(can_be_cought_alarm <= 0){
	can_be_cought = true;
}

dir = point_direction(x, y, spawner.x, spawner.y);
h_velocity += lengthdir_x(return_acceleration, dir);
v_velocity += lengthdir_y(return_acceleration, dir);