if(gamepad_button_check_pressed(controller_index, gp_padl) && !position_meeting(x-move_distance, y, Parent_Collision)){
	x -= move_distance;
}
else if(gamepad_button_check_pressed(controller_index, gp_padr) && !position_meeting(x+move_distance, y, Parent_Collision)){
	x += move_distance;
}
else if(gamepad_button_check_pressed(controller_index, gp_padu) && !position_meeting(x, y-move_distance, Parent_Collision)){
	y -= move_distance;
}
else if(gamepad_button_check_pressed(controller_index, gp_padd) && !position_meeting(x, y+move_distance, Parent_Collision)){
	y += move_distance;
}

if(gamepad_button_check_pressed(controller_index, gp_start)){
	room_goto(Arena1);
}

// Clear portrait
if(!place_meeting(x, y, Parent_Portrait)){
	if(index == 0 && global.picked_characters[0] == noone){
		P1_Preview.sprite_index = Spr_EMPTY;
	}
	else if(index == 1 && global.picked_characters[1] == noone){
		P2_Preview.sprite_index = Spr_EMPTY;
	}
}