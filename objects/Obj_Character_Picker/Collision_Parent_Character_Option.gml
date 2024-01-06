if(gamepad_button_check_pressed(controller_index, gp_face1)){
	if(connection != noone){
		global.picked_characters[connection.index] = other.character;
		global.is_CPU[connection.index] = true;
		connection.connection = other;
		connection = noone;
	}
	else{
		global.picked_characters[index] = other.character;
		if(index == 0){
			P1_Preview.sprite_index = other.animation;
		}
		else if(index == 1){
			P2_Preview.sprite_index = other.animation;
		}
	}
}

if(index == 0 && global.picked_characters[0] == noone){
	P1_Preview.sprite_index = other.animation;
}
else if(index == 1 && global.picked_characters[1] == noone){
	P2_Preview.sprite_index = other.animation;
}