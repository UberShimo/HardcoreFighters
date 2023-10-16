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
	room_goto(room0);
}