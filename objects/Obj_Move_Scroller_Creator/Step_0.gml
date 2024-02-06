
for(i = 0; i < max_pickers; i++){
	if(gamepad_button_check_pressed(i, gp_face1)){
		controller_index_is_used = false;
		
		// Check if controller is already in use
		for(c = 0; c < array_length(global.controller_indexes); c++){
			if(global.controller_indexes[c] == i){
				controller_index_is_used = true;
			}
		}
		
		if(!controller_index_is_used){
			for(j = 0; j < array_length(global.controller_indexes); j++){
				if(global.controller_indexes[j] == -1){ // -1 = empty
					scroller = instance_create_depth(x, y, depth, Obj_Move_Scroller);
					scroller.index = j;
					scroller.controller_index = i;
					global.controller_indexes[j] = i;
					exit;
				}
			}
		}
	}
}