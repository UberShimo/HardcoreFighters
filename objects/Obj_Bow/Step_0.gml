// Super jump fix
if(down_hold){
	jump_power = 16;
}
else{
	jump_power = 12;
}

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
			sprite_index = Spr_Bow_8F_startup;
			image_index = 0;
			action_alarm = generate_sprite_frames(sprite_index);
		}
		else if(half_circle_forward_pressed){
			action = "426F";
			sprite_index = Spr_Bow_Boomerang_Throw_startup;
			image_index = 0;
			action_alarm = generate_sprite_frames(sprite_index);
		}
		else if(down_forward_pressed){
			action = "26F";
			sprite_index = Spr_Bow_Boomerang_Throw_startup;
			image_index = 0;
			action_alarm = generate_sprite_frames(sprite_index);
		}
		else if(down_hold){
			action = "2F";
			sprite_index = Spr_Bow_2F_startup;
			image_index = 0;
			action_alarm = generate_sprite_frames(sprite_index);
		}
		else{
			action = "5F";
			sprite_index = Spr_Bow_5F_startup;
			image_index = 0;
			action_alarm = generate_sprite_frames(sprite_index);
		}
	}
	else if(y_pressed){
		if(down_forward_pressed){
			action = "aim_d";
			aim_dir = -45;
			sprite_index = Spr_Bow_Aim_Down_startup;
			image_index = 0;
			action_alarm = generate_sprite_frames(sprite_index);
		}
		else if(forward_down_pressed){
			action = "aim_u";
			aim_dir = 45;
			sprite_index = Spr_Bow_Aim_Up_startup;
			image_index = 0;
			action_alarm = generate_sprite_frames(sprite_index);
		}
		else if(!grounded){
			action = "8L";
			sprite_index = Spr_Bow_8L_startup;
			image_index = 0;
			action_alarm = generate_sprite_frames(sprite_index);
		}
		else if(down_hold){
			action = "2L";
			sprite_index = Spr_Bow_2L_startup;
			image_index = 0;
			action_alarm = generate_sprite_frames(sprite_index);
			multi_hit_action_index = 0;
		}
		else{
			action = "5L";
			h_velocity = 3*image_xscale;
			sprite_index = Spr_Bow_5L_startup;
			image_index = 0;
			action_alarm = generate_sprite_frames(sprite_index);
		}
	}
	else if(b_pressed){
		if(!grounded){
			action = "8S";
			sprite_index = Spr_Bow_8S_startup;
			image_index = 0;
			action_alarm = generate_sprite_frames(sprite_index);
		}
		else if(half_circle_forward_pressed){
			action = "426S";
			sprite_index = Spr_Bow_High_startup;
			image_index = 0;
			action_alarm = generate_sprite_frames(sprite_index);
		}
		else if(half_circle_backward_pressed){
			action = "624S";
			sprite_index = Spr_Bow_Sweep_startup;
			image_index = 0;
			action_alarm = generate_sprite_frames(sprite_index);
		}
		else if(down_forward_pressed){
			action = "26S";
			h_velocity = 10*image_xscale;
			is_collidable = false;
			sprite_index = Spr_Bow_Backsmack_startup;
			image_index = 0;
			action_alarm = generate_sprite_frames(sprite_index);
		}
		else if(down_hold){
			action = "2S";
			grip = original_grip/2;
			h_velocity = 6*image_xscale;
			sprite_index = Spr_Bow_2S_startup;
			image_index = 0;
			action_alarm = generate_sprite_frames(sprite_index);
		}
		else{
			action = "5S";
			sprite_index = Spr_Bow_5S_startup;
			image_index = 0;
			action_alarm = generate_sprite_frames(sprite_index);
		}
	}
	else if(rb_pressed){
		if(half_circle_forward_pressed && meter >= 100){
			action = "426X";
			meter -= 100;
			sprite_index = Spr_Bow_ULTRA_startup;
			image_index = 0;
			global.game_time = 0.25;
			action_alarm = generate_sprite_frames(sprite_index);
			alarm[10] = action_alarm*4;
		}
		else if(meter >= 25 && grounded){
			action = "X";
			meter -= 25;
			
			sprite_index = Spr_Bow_Upstream_startup;
			image_index = 0;
			action_alarm = generate_sprite_frames(sprite_index);
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

// Bows air control
if(!grounded){
	if(forward_hold){
		h_velocity += 0.15*image_xscale;
		wind_eff_counter += logic_time;
		
		if(wind_eff_counter >= 1){
			wind_eff_counter = 0;
			x_pos = random_range(x-character_width/2, x+character_width/2);
			y_pos = random_range(y-character_height/2, y+character_height/2);
			eff = instance_create_depth(x_pos, y_pos, depth-1, Eff_Pixel);
			eff.h_velocity = 8*image_xscale;
			eff.image_xscale = 8*image_xscale;
			eff.image_alpha = 0.25;
		}
	}
	else if(backward_hold){
		h_velocity -= 0.1*image_xscale;
		wind_eff_counter += logic_time;
		
		if(wind_eff_counter >= 1){
			wind_eff_counter = 0;
			x_pos = random_range(x-character_width/2, x+character_width/2);
			y_pos = random_range(y-character_height/2, y+character_height/2);
			eff = instance_create_depth(x_pos, y_pos, depth-1, Eff_Pixel);
			eff.h_velocity = -8*image_xscale;
			eff.image_xscale = -8*image_xscale;
			eff.image_alpha = 0.25;
		}
	}
}

// Aim down logic
if(action == "aim_d" && y_hold){
	aim_dir += (45/aim_duration)*logic_time;
}
// Aim up logic
else if(action == "aim_u" && y_hold){
	aim_dir -= (45/aim_duration)*logic_time;
}