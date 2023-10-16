if(global.picked_characters[0] != noone){
	player = instance_create_depth(x, y, 0, global.picked_characters[0]);
	player.index = 1;
	player.controller_index = global.controller_indexes[0];
	
	if(global.is_CPU[0] == true){
		player.is_CPU = true;
		player.alarm[11] = 180;
	}
}
