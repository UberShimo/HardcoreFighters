if(gamepad_button_check_pressed(controller_index, gp_padl) && !place_meeting(x-move_x_distance, y, Parent_Collision)){
	x -= move_x_distance;
}
else if(gamepad_button_check_pressed(controller_index, gp_padr) && !place_meeting(x+move_x_distance, y, Parent_Collision)){
	x += move_x_distance;
}
else if(gamepad_button_check_pressed(controller_index, gp_padu)){
	if(!place_meeting(x+move_x_distance/2, y-move_y_distance, Parent_Collision)){
		y -= move_y_distance;
		x += move_x_distance/2;
	}
	else if(!place_meeting(x-move_x_distance/2, y-move_y_distance, Parent_Collision)){
		y -= move_y_distance;
		x -= move_x_distance/2;
	}
}
else if(gamepad_button_check_pressed(controller_index, gp_padd)){
	if(!place_meeting(x-move_x_distance/2, y+move_y_distance, Parent_Collision)){
		y += move_y_distance;
		x -= move_x_distance/2;
	}
	else if(!place_meeting(x+move_x_distance/2, y+move_y_distance, Parent_Collision)){
		y += move_y_distance;
		x += move_x_distance/2;
	}
}

// Click an option
if(gamepad_button_check_pressed(controller_index, gp_face1)
&& place_meeting(x, y, Parent_Character_Select_Option)){
	option = instance_place(x, y, Parent_Character_Select_Option);
	option.clicked(self);
}

// Unpick character
if(gamepad_button_check_pressed(controller_index, gp_face2)
&& global.picked_characters[index] != noone){
	global.picked_characters[index] = noone;
	if(tag != noone){
		instance_destroy(tag);
		tag = noone;
	}
}

// Return to Main menu
if(gamepad_button_check(controller_index, gp_face2)){
	exit_count += 1;
	
	if(exit_count > exit_count_goal){
		room_goto(Main_Menu);
	}
}
else{
	exit_count = 0;
}

// Show move list
if(gamepad_button_check_pressed(controller_index, gp_face4)
&& place_meeting(x, y, Parent_Character_Option)){
	option = instance_place(x, y, Parent_Character_Option);
	room_goto(option.move_list_room);
}

// Start match
if(gamepad_button_check_pressed(controller_index, gp_start)){
	all_players_ready = true;
	
	for(i = 0; i < global.min_players; i++){
		if(global.picked_characters[i] == noone){
			all_players_ready = false;
		}
	}
	
	if(all_players_ready){
		if(global.dojo_mode){
			room_goto(Dojo_Place);
		}
		else{
			room_goto(global.arena);
		}
	}
}

if(room == Character_Select_1v1){
	// Change portrait
	if(place_meeting(x, y, Parent_Character_Option)){
		option = instance_place(x, y, Parent_Character_Option);
		if(index == 0 && global.picked_characters[0] == noone){
			P1_Preview.sprite_index = option.portrait;
		}
		else if(index == 1 && global.picked_characters[1] == noone){
			P2_Preview.sprite_index = option.portrait;
		}
	}
	// Clear portrait
	else{
		if(index == 0 && global.picked_characters[0] == noone){
			P1_Preview.sprite_index = Spr_EMPTY;
		}
		else if(index == 1 && global.picked_characters[1] == noone){
			P2_Preview.sprite_index = Spr_EMPTY;
		}
	}
}