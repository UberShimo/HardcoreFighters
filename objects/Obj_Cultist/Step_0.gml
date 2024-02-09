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
		if(half_circle_forward_pressed && instance_exists(circle)){
			if(circle.implode_alarm == 0){
				action = "Circle Teleport";
			
				sprite_index = Spr_Cultist_Circlepull_startup;
				image_index = 0;
				action_alarm = generate_sprite_frames(sprite_index);
			}
		}
		else if(half_circle_backward_pressed && instance_exists(circle)){
			if(circle.implode_alarm == 0){
				action = "Circle Pullback";
			
				sprite_index = Spr_Cultist_Circlepull_startup;
				image_index = 0;
				action_alarm = generate_sprite_frames(sprite_index);
			}
		}
		else if(down_forward_pressed){
			action = "Circle Dash Forward";
			
			h_velocity = 0;
			v_velocity = 0;
			weight = 0;
			
			sprite_index = Spr_Cultist_Circledash_startup;
			image_index = 0;
			action_alarm = generate_sprite_frames(sprite_index);
		}
		else if(down_backward_pressed){
			action = "Circle Dash Backward";
			
			h_velocity = 0;
			v_velocity = 0;
			weight = 0;
			
			sprite_index = Spr_Cultist_Circledash_startup;
			image_index = 0;
			action_alarm = generate_sprite_frames(sprite_index);
		}
		else if(!grounded){
			action = "F";
			sprite_index = Spr_Cultist_F_startup;
			image_index = 0;
			action_alarm = generate_sprite_frames(sprite_index);
		}
		else if(down_hold){
			action = "2F";
			sprite_index = Spr_Cultist_2F_startup;
			image_index = 0;
			action_alarm = generate_sprite_frames(sprite_index);
		}
		else{
			action = "F";
			sprite_index = Spr_Cultist_F_startup;
			image_index = 0;
			action_alarm = generate_sprite_frames(sprite_index);
		}
	}
	else if(y_pressed){
		if(half_circle_forward_pressed){
			action = "Straight Star";
			sprite_index = Spr_Cultist_Starthrow_startup;
			image_index = 0;
			action_alarm = generate_sprite_frames(sprite_index);
		}
		else if(down_forward_pressed){
			action = "Falling Star";
			sprite_index = Spr_Cultist_Starthrow_startup;
			image_index = 0;
			action_alarm = generate_sprite_frames(sprite_index);
		}
		else if(backward_down_pressed){
			action = "Rising Star";
			sprite_index = Spr_Cultist_Starthrow_startup;
			image_index = 0;
			action_alarm = generate_sprite_frames(sprite_index);
		}
		else if(forward_down_pressed){
			action = "Lightning";
			sprite_index = Spr_Cultist_Lightning_startup;
			image_index = 0;
			action_alarm = generate_sprite_frames(sprite_index);
		}
		else if(!grounded){
			action = "L";
			sprite_index = Spr_Cultist_L_startup;
			image_index = 0;
			action_alarm = generate_sprite_frames(sprite_index);
		}
		else if(down_hold){
			action = "2L";
			sprite_index = Spr_Cultist_2L_startup;
			image_index = 0;
			action_alarm = generate_sprite_frames(sprite_index);
		}
		else{
			action = "L";
			sprite_index = Spr_Cultist_L_startup;
			image_index = 0;
			action_alarm = generate_sprite_frames(sprite_index);
		}
	}
	else if(b_pressed){
		if(down_forward_pressed){
			shadow.time_to_bite_buffer = buffer_duration;
		}
		else if(!grounded){
			action = "8S";
			sprite_index = Spr_Cultist_8S_startup;
			image_index = 0;
			action_alarm = generate_sprite_frames(sprite_index);
		}
		else if(half_circle_forward_pressed){
			action = "High";
			sprite_index = Spr_Cultist_High_startup;
			image_index = 0;
			action_alarm = generate_sprite_frames(sprite_index);
		}
		else if(half_circle_backward_pressed){
			action = "Sweep";
			sprite_index = Spr_Cultist_Sweep_startup;
			image_index = 0;
			action_alarm = generate_sprite_frames(sprite_index);
		}
		else if(forward_down_pressed){
			action = "Plant Mine";
			sprite_index = Spr_Cultist_Mine_startup;
			image_index = 0;
			action_alarm = generate_sprite_frames(sprite_index);
		}
		else if(down_hold){
			action = "2S";
			sprite_index = Spr_Cultist_2S_startup;
			image_index = 0;
			action_alarm = generate_sprite_frames(sprite_index);
		}
		else{
			action = "5S";
			sprite_index = Spr_Cultist_5S_startup;
			image_index = 0;
			action_alarm = generate_sprite_frames(sprite_index);
		}
	}
	else if(rb_pressed){
		if(half_circle_forward_pressed && meter >= 100){
			action = "ULTRA";
			meter -= 100;
			sprite_index = Spr_Cultist_ULTRA_startup;
			image_index = 0;
			global.game_time = 0.25;
			action_alarm = generate_sprite_frames(sprite_index);
			Obj_Match_Manager.global_time_reset_alarm = action_alarm*4;
			
			spawner = instance_create_depth(x, y-96, 0, Obj_Zombie_Spawner);
			spawner.index = index;
			spawner.zombie_color = player_color;
			spawner.character_to_spawn = closest_enemy.object_index;
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

// Heal logic
if(action == "Heal"){
	if(HP < max_HP){
		HP += logic_time/2;
	}
	else{
		HP = max_HP;
	}
}

// Time slowdown logic
if(is_slowing_down_time){
	if(meter >= logic_time && rb_hold){
		meter -= logic_time;
	}
	else{
		is_slowing_down_time = false;
		if(Obj_Match_Manager.global_time_reset_alarm < 1){
			Obj_Match_Manager.global_time_reset_alarm = 1;
		}
	}
}
else if(rb_hold && meter >= logic_time && global.game_time > slow_amount){
	is_slowing_down_time = true;
	global.game_time = slow_amount;
}