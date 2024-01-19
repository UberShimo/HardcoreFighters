event_inherited();

time_to_bite_buffer -= logic_time;

// Alarms
if(action_alarm > 0){
	action_alarm -= logic_time;
	if(action_alarm <= 0){
		action_trigger();
	}
}
if(recover_alarm > 0){
	recover_alarm -= logic_time;
	if(recover_alarm <= 0){
		action = noone;
		sprite_index = Spr_Cultist_Shadow;
	}
}

// Actions
if(time_to_bite_buffer && action == noone){
	action = "Bite";
	sprite_index = Spr_Cultist_Shadow_Bite_startup;
	image_index = 0;
	action_alarm = generate_sprite_frames(sprite_index);
}

// Movement
if(spawner != noone){
	if(spawner.forward_hold){
		x += move_speed*spawner.image_xscale*logic_time;
	}
	else if(spawner.backward_hold){
		x -= move_speed*spawner.image_xscale*logic_time;
	}
}