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
	
	// Only used for moves that ends combo
	final_move = false;
	
	if(grounded && !is_blocking){
		face_closest_enemy();
	}
	reset_physics();
	
	if(x_pressed){
		if(!grounded){
			action = "8F";
			sprite_index = Spr_Batman_8F_startup;
			image_index = 0;
			action_alarm = generate_sprite_frames(sprite_index);
		}
		else if(down_forward_pressed){
			action = "Pitch";
			sprite_index = Spr_Batman_Pitch_startup;
			image_index = 0;
			action_alarm = generate_sprite_frames(sprite_index);
		}
		else if(forward_down_pressed){
			action = "Curve Pitch";
			sprite_index = Spr_Batman_Pitch_startup;
			image_index = 0;
			action_alarm = generate_sprite_frames(sprite_index);
		}
		else if(down_hold){
			action = "2F";
			sprite_index = Spr_Batman_2F_startup;
			image_index = 0;
			action_alarm = generate_sprite_frames(sprite_index);
		}
		else{
			action = "5F";
			sprite_index = Spr_Batman_5F_startup;
			image_index = 0;
			action_alarm = generate_sprite_frames(sprite_index);
		}
		reset_buffers();
	}
	else if(y_pressed){
		if(half_circle_forward_pressed){
			action = "Dropkick";
			
			if(grounded){
				h_velocity += 2*image_xscale;
				v_velocity = -6;
			}
			
			sprite_index = Spr_Batman_Dropkick_startup;
			image_index = 0;
			action_alarm = generate_sprite_frames(sprite_index);
		}
		else if(down_forward_pressed){
			action = "Spinhop";
			
			h_velocity = 2*image_xscale;
			v_velocity = -7;
			
			if(!grounded){
				v_velocity = -4;
			}
			
			sprite_index = Spr_Batman_Spinhop_startup;
			image_index = 0;
			action_alarm = generate_sprite_frames(sprite_index);
		}
		else if(!grounded){
			action = "8L";
			sprite_index = Spr_Batman_8L_startup;
			image_index = 0;
			action_alarm = generate_sprite_frames(sprite_index);
		}
		else if(down_hold){
			action = "2L";
			sprite_index = Spr_Batman_2L_startup;
			image_index = 0;
			action_alarm = generate_sprite_frames(sprite_index);
			multi_hit_action_index = 0;
		}
		else{
			action = "5L";
			h_velocity += 4*image_xscale;
			sprite_index = Spr_Batman_5L_startup;
			image_index = 0;
			action_alarm = generate_sprite_frames(sprite_index);
		}
		reset_buffers();
	}
	else if(b_pressed){
		if(!grounded){
			action = "8S";
			sprite_index = Spr_Batman_8S_startup;
			image_index = 0;
			action_alarm = generate_sprite_frames(sprite_index);
		}
		else if(half_circle_forward_pressed){
			action = "High";
			sprite_index = Spr_Batman_High_startup;
			image_index = 0;
			action_alarm = generate_sprite_frames(sprite_index);
		}
		else if(half_circle_backward_pressed){
			action = "Sweep";
			sprite_index = Spr_Batman_Sweep_startup;
			image_index = 0;
			action_alarm = generate_sprite_frames(sprite_index);
		}
		else if(down_forward_pressed){
			action = "Headbutt";
			is_unstoppable = true;
			sprite_index = Spr_Batman_Headbutt_startup;
			image_index = 0;
			action_alarm = generate_sprite_frames(sprite_index);
		}
		else if(down_hold){
			action = "2S";
			sprite_index = Spr_Batman_2S_startup;
			image_index = 0;
			action_alarm = generate_sprite_frames(sprite_index);
		}
		else{
			action = "5S";
			sprite_index = Spr_Batman_5S_startup;
			image_index = 0;
			action_alarm = generate_sprite_frames(sprite_index);
		}
		reset_buffers();
	}
	else if(rb_pressed){
		if(half_circle_forward_pressed && meter >= 100){
			action = "ULTRA";
			meter -= 50;
			sprite_index = Spr_Batman_ULTRA_startup;
			image_index = 0;
			global.game_time = 0.25;
			action_alarm = generate_sprite_frames(sprite_index);
			Obj_Match_Manager.global_time_reset_alarm = action_alarm*4;
			
			audio_play_sound(Snd_AP1, 0, false);
		}
		else if(meter >= 25){
			action = "X";
			meter -= 25;
			sprite_index = Spr_Batman_Pitch_startup;
			image_index = 0;
			action_alarm = generate_sprite_frames(sprite_index);
		}
		reset_buffers();
	}
	
	// Check if cancel is legit
	if(action == last_action){
		sprite_index = last_sprite;
		image_index = last_image_index;
		action_alarm = last_action_alarm;
		last_action = noone;
		h_velocity = last_h_velocity;
		v_velocity = last_v_velocity;
		grip = last_grip;
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
