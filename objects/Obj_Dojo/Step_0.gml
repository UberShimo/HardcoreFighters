event_inherited();

// ACTION!
if(action_button_pressed() && (action == noone || check_for_cancel())){
	last_action = action;
	last_action_alarm = action_alarm;
	last_sprite = sprite_index;
	last_image_index = image_index;
	last_h_velocity = h_velocity;
	last_v_velocity = v_velocity;
	last_grip = grip;
	last_air_grip = air_grip;
	
	// Only used for moves that ends combo
	final_move = false;
	
	if(grounded && !is_blocking){
		face_closest_enemy();
	}
	reset_physics();
	
	if(x_pressed){
		action = "F";
		sprite_index = Spr_Dojo_F_startup;
		image_index = 0;
		action_alarm = generate_sprite_frames(sprite_index);
	}
	else if(y_pressed){
		action = "L";
		sprite_index = Spr_Dojo_L_startup;
		image_index = 0;
		action_alarm = generate_sprite_frames(sprite_index);
	}
	else if(b_pressed){
		action = "S";
		sprite_index = Spr_Dojo_S_startup;
		image_index = 0;
		action_alarm = generate_sprite_frames(sprite_index);
	}
	reset_buffers();
	
	// Check if cancel is legit
	if(action == last_action){
		sprite_index = last_sprite;
		image_index = last_image_index;
		action_alarm = last_action_alarm;
		last_action = noone;
		h_velocity = last_h_velocity;
		v_velocity = last_v_velocity;
		grip = last_grip;
		air_grip = last_air_grip;
	}
	// Cancel is legit
	else if(recover_alarm > 0){
		cancels -= 1;
		can_cancel = false;
		recover_alarm = 0;
		// Cancel eff
		eff = instance_create_depth(x, y, 1, Eff_Cancel);
		eff.initiate(self);
	}
}
