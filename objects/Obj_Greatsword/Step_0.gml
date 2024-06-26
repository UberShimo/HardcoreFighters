// ULTRA speed up
if(action == "ULTRA" || action == "More Smash"){
	object_time = 1+0.3*multi_hit_action_index;
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
	
	// Only used for moves that ends combo
	final_move = false;
	
	if(grounded && !is_blocking){
		face_closest_enemy();
	}
	reset_physics();
	
	if(x_pressed){
		if(!grounded){
			action = "8F";
			sprite_index = Spr_Greatsword_8F_startup;
			image_index = 0;
			action_alarm = generate_sprite_frames(sprite_index);
		}
		else if(down_forward_pressed){
			action = "Earth Start";
			is_blocking = true;
			grip = 0.2;
			h_velocity = 4*image_xscale;
			sprite_index = Spr_Greatsword_Earth_startup;
			image_index = 0;
			action_alarm = generate_sprite_frames(sprite_index);
		}
		else if(down_backward_pressed){
			action = "Earth Start";
			is_blocking = true;
			grip = 0.2;
			h_velocity = -4*image_xscale;
			sprite_index = Spr_Greatsword_Earth_startup;
			image_index = 0;
			action_alarm = generate_sprite_frames(sprite_index);
		}
		else if(forward_down_pressed){
			action = "Stomp";
			pillar_distance = 60;
			sprite_index = Spr_Greatsword_Stomp_startup;
			image_index = 0;
			action_alarm = generate_sprite_frames(sprite_index);
		}
		else if(down_hold){
			action = "2F";
			sprite_index = Spr_Greatsword_2F_startup;
			image_index = 0;
			action_alarm = generate_sprite_frames(sprite_index);
		}
		else{
			action = "5F";
			sprite_index = Spr_Greatsword_5F_startup;
			image_index = 0;
			action_alarm = generate_sprite_frames(sprite_index);
		}
	}
	else if(y_pressed){
		if(!grounded){
			action = "8L";
			sprite_index = Spr_Greatsword_8L_startup;
			image_index = 0;
			action_alarm = generate_sprite_frames(sprite_index);
		}
		else if(down_forward_pressed){
			action = "Ocean Start";
			grip = 0.4;
			h_velocity = 8*image_xscale;
			sprite_index = Spr_Greatsword_Ocean_startup;
			image_index = 0;
			action_alarm = generate_sprite_frames(sprite_index);
		}
		else if(down_backward_pressed){
			action = "Heaven Start";
			
			h_velocity = -8*image_xscale;
			
			sprite_index = Spr_Greatsword_Heaven_startup;
			image_index = 0;
			action_alarm = generate_sprite_frames(sprite_index);
		}
		else if(forward_down_pressed){
			action = "Stomp";
			pillar_distance = 120;
			sprite_index = Spr_Greatsword_Stomp_startup;
			image_index = 0;
			action_alarm = generate_sprite_frames(sprite_index);
		}
		else if(down_hold){
			action = "2L";
			sprite_index = Spr_Greatsword_2L_startup;
			image_index = 0;
			action_alarm = generate_sprite_frames(sprite_index);
		}
		else{
			action = "5L";
			h_velocity += 3*image_xscale;
			sprite_index = Spr_Greatsword_5L_startup;
			image_index = 0;
			action_alarm = generate_sprite_frames(sprite_index);
		}
	}
	else if(b_pressed){
		if(!grounded){
			action = "8S";
			sprite_index = Spr_Greatsword_8S_startup;
			image_index = 0;
			action_alarm = generate_sprite_frames(sprite_index);
		}
		else if(half_circle_forward_pressed){
			action = "High";
			sprite_index = Spr_Greatsword_High_startup;
			image_index = 0;
			action_alarm = generate_sprite_frames(sprite_index);
		}
		else if(half_circle_backward_pressed){
			action = "Sweep";
			
			h_velocity = 8*image_xscale;
			
			sprite_index = Spr_Greatsword_Sweep_startup;
			image_index = 0;
			action_alarm = generate_sprite_frames(sprite_index);
		}
		else if(forward_down_pressed){
			action = "Stomp";
			pillar_distance = 180;
			sprite_index = Spr_Greatsword_Stomp_startup;
			image_index = 0;
			action_alarm = generate_sprite_frames(sprite_index);
		}
		else if(down_hold){
			action = "2S";
			h_velocity = 4*image_xscale;
			grip = 0.1;
			sprite_index = Spr_Greatsword_2S_startup;
			image_index = 0;
			action_alarm = generate_sprite_frames(sprite_index);
		}
		else{
			action = "5S";
			sprite_index = Spr_Greatsword_5S_startup;
			image_index = 0;
			action_alarm = generate_sprite_frames(sprite_index);
		}
	}
	else if(rb_pressed){
		if(half_circle_forward_pressed && meter >= 100){
			action = "ULTRA";
			meter -= 50;
			sprite_index = Spr_Greatsword_ULTRA_startup;
			image_index = 0;
			global.game_time = 0.25;
			action_alarm = generate_sprite_frames(sprite_index);
			Obj_Match_Manager.global_time_reset_alarm = action_alarm*4;
			multi_hit_action_index = 0;
		}
		else{
			action = "X";
			sprite_index = Spr_Greatsword_X_startup;
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
// Ughhhh stances...
else if(action == "Earth"){
	if(x_pressed){
		action = "Earth F";
		sprite_index = Spr_Greatsword_Earth_F_startup;
		image_index = 0;
		action_alarm = generate_sprite_frames(sprite_index);
		recover_alarm = 0;
	}
	else if(y_pressed){
		action = "Earth L";
		sprite_index = Spr_Greatsword_Earth_L_startup;
		image_index = 0;
		action_alarm = generate_sprite_frames(sprite_index);
		recover_alarm = 0;
	}
	else if(b_pressed){
		action = "Earth S";
		sprite_index = Spr_Greatsword_Earth_S_startup;
		image_index = 0;
		action_alarm = generate_sprite_frames(sprite_index);
		recover_alarm = 0;
	}
	reset_buffers();
}
else if(action == "Ocean"){
	if(x_pressed){
		action = "Ocean F";
		sprite_index = Spr_Greatsword_Ocean_F_startup;
		image_index = 0;
		action_alarm = generate_sprite_frames(sprite_index);
		recover_alarm = 0;
		multi_hit_action_index = 0;
	}
	else if(y_pressed){
		action = "Ocean L";
		sprite_index = Spr_Greatsword_Ocean_L_startup;
		image_index = 0;
		action_alarm = generate_sprite_frames(sprite_index);
		recover_alarm = 0;
	}
	else if(b_pressed){
		action = "Ocean S";
		sprite_index = Spr_Greatsword_Ocean_S_startup;
		image_index = 0;
		action_alarm = generate_sprite_frames(sprite_index);
		recover_alarm = 0;
	}
	reset_buffers();
}
else if(action == "Heaven"){
	if(x_pressed){
		action = "Heaven F";
		sprite_index = Spr_Greatsword_Heaven_F_startup;
		image_index = 0;
		action_alarm = generate_sprite_frames(sprite_index);
		recover_alarm = 0;
	}
	else if(y_pressed){
		action = "Heaven L";
		
		h_velocity = 8*image_xscale;
		
		sprite_index = Spr_Greatsword_Heaven_L_startup;
		image_index = 0;
		action_alarm = generate_sprite_frames(sprite_index);
		recover_alarm = 0;
	}
	else if(b_pressed){
		action = "Heaven S";
		
		h_velocity = 8*image_xscale;
		grip = 0.25;
		
		sprite_index = Spr_Greatsword_Heaven_S_startup;
		image_index = 0;
		action_alarm = generate_sprite_frames(sprite_index);
		recover_alarm = 0;
	}
	// Just jump outa it
	else if(a_pressed){
		action = noone;
		
		action_alarm = 0;
		recover_alarm = 0;
		
		v_velocity = -jump_power;
		
		if(forward_hold){
			h_velocity = start_speed*image_xscale;
		}
		else if(backward_hold){
			h_velocity = -start_speed*image_xscale;
		}
	}
	reset_buffers();
}

// Movement during earth_L
if(action == "Earth L" && recover_alarm > 16){
	h_velocity = 0;
	
	if(forward_hold){
		h_velocity = 3*image_xscale*logic_time;
	}
	else if(backward_hold){
		h_velocity = -3*image_xscale*logic_time;
	}
}
