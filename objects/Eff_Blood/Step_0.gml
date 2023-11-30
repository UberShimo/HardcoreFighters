if(seek_spawn){
	// Step toward spawn
	dir = point_direction(x, y, Obj_Respawner.x, Obj_Respawner.y);
	x += lengthdir_x(4, dir);
	y += lengthdir_y(4, dir);
}

if(life_span > 0){
	life_span -= global.game_time;
	
	if(life_span <= 0){
		instance_destroy();
	}
}