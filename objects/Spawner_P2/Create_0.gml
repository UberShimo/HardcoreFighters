if(global.picked_characters[1] != noone){
	player = instance_create_depth(x, y, 0, global.picked_characters[1]);
	player.index = 2;
	player.controller_index = global.controller_indexes[1];
	
	if(global.is_CPU[1] == true){
		player.is_CPU = true;
		player.alarm[11] = 180;
	}
}
