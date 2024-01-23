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
		if(!grounded){
			action = "8F";
			sprite_index = Spr_Boomhand_8F_startup;
			image_index = 0;
			action_alarm = generate_sprite_frames(sprite_index);
		}
		else if(half_circle_forward_pressed && roars < max_roars){
			action = "Roar";
			sprite_index = Spr_Boomhand_Roar_startup;
			image_index = 0;
			action_alarm = generate_sprite_frames(sprite_index);
		}
		else if(forward_down_pressed){
			action = "Groundsmash";
			sprite_index = Spr_Boomhand_Groundsmash_startup;
			image_index = 0;
			action_alarm = generate_sprite_frames(sprite_index);
		}
		else if(down_hold){
			action = "2F";
			sprite_index = Spr_Boomhand_2F_startup;
			image_index = 0;
			action_alarm = generate_sprite_frames(sprite_index);
		}
		else{
			action = "5F";
			sprite_index = Spr_Boomhand_5F_startup;
			image_index = 0;
			action_alarm = generate_sprite_frames(sprite_index);
		}
	}
	else if(y_pressed){
		if(down_forward_pressed){
			action = "Fistdive";
			
			weight = 0.1;
			
			sprite_index = Spr_Boomhand_Fistdive_startup;
			image_index = 0;
			action_alarm = generate_sprite_frames(sprite_index);
			
			h_velocity = 0;
			v_velocity = -2;
			if(grounded){
				v_velocity = -8;
				weight = original_weight;
			}
		}
		else if(!grounded){
			action = "8L";
			sprite_index = Spr_Boomhand_8L_startup;
			image_index = 0;
			action_alarm = generate_sprite_frames(sprite_index);
		}
		else if(down_backward_pressed){
			action = "Backstep";
			
			h_velocity = -12*image_xscale;
			
			sprite_index = Spr_Boomhand_Backstep_startup;
			image_index = 0;
			action_alarm = generate_sprite_frames(sprite_index);
		}
		else if(down_hold){
			action = "2L";
			sprite_index = Spr_Boomhand_2L_startup;
			image_index = 0;
			action_alarm = generate_sprite_frames(sprite_index);
		}
		else{
			action = "5L";
			h_velocity = 6*image_xscale;
			sprite_index = Spr_Boomhand_5L_startup;
			image_index = 0;
			action_alarm = generate_sprite_frames(sprite_index);
		}
	}
	else if(b_pressed){
		if(!grounded){
			action = "8S";
			sprite_index = Spr_Boomhand_8S_startup;
			image_index = 0;
			action_alarm = generate_sprite_frames(sprite_index);
		}
		else if(half_circle_forward_pressed){
			action = "High";
			
			h_velocity = 6*image_xscale;
			
			sprite_index = Spr_Boomhand_High_startup;
			image_index = 0;
			action_alarm = generate_sprite_frames(sprite_index);
		}
		else if(half_circle_backward_pressed){
			action = "Sweep";
			sprite_index = Spr_Boomhand_Sweep_startup;
			image_index = 0;
			action_alarm = generate_sprite_frames(sprite_index);
		}
		else if(down_hold){
			action = "2S";
			sprite_index = Spr_Boomhand_2S_startup;
			image_index = 0;
			action_alarm = generate_sprite_frames(sprite_index);
		}
		else{
			action = "5S";
			hook_charge = 0;
			sprite_index = Spr_Boomhand_5S_startup;
			image_index = 0;
			action_alarm = generate_sprite_frames(sprite_index);
		}
	}
	else if(rb_pressed){
		if(half_circle_forward_pressed && meter >= 100){
			action = "ULTRA";
			meter -= 100;
			sprite_index = Spr_Boomhand_ULTRA_recovery;
			image_index = 0;
			global.game_time = 0.25;
			action_alarm = generate_sprite_frames(sprite_index);
			Obj_Match_Manager.global_time_reset_alarm = action_alarm*4;
		}
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

if(action == "Hook Charge"){
	// Charged enough
	if(!b_hold || hook_charge >= 1){
		action = "5S";
		action_alarm = 1;
	}
	// Keep charging
	else{
		hook_charge += logic_time/max_charge_duration;
		shake_amount += logic_time/15;
	}
}

// Smoke logic
if(rb_hold && meter >= 2 && smoke_cd <= 0){
	instance_create_depth(x, y, depth-10, Obj_Boomhand_Smoke);
	meter -= 2;
	smoke_cd = smoke_max_cd;
}
if(smoke_cd > 0){
	smoke_cd -= logic_time;
}

// Roar effect
if(roars > 0 && effect_counter >= 1){
	repeat(roars){
		x_spawn = x+random_range(-character_width/2, character_width/2);
		y_spawn = y+random_range(-character_height/2, character_height/2);
		eff = instance_create_depth(x_spawn, y_spawn, depth-1, Eff_Pixel);
		eff.image_blend = c_orange;
		eff.image_xscale = roars/2;
		eff.image_yscale = roars/2;
		eff.v_velocity = -0.25;
	}
}