if(gamepad_button_check_pressed(controller_index, gp_face1)){
	global.picked_characters[index] = other.character;
}

if(index == 0){
	P1_Preview.sprite_index = other.animation;
}
else if(index == 1){
	P2_Preview.sprite_index = other.animation;
}