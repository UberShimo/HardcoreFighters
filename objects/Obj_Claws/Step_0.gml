if(is_hypermode){
	object_time = 3;
	meter = 0;
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
		if(down_forward_pressed && instance_exists(ring1)){
			action = "Dive";
			instance_create_depth(x, y, depth, Eff_Claws_Teleport);
			weight = 0;
			x = ring1.x;
			y = ring1.y;
			instance_destroy(ring1);
			sprite_index = Spr_Claws_Dive_startup;
			image_index = 0;
			action_alarm = generate_sprite_frames(sprite_index);
		}
		else if(forward_down_pressed && instance_exists(ring1)){
			action = "Deep Dive";
			instance_create_depth(x, y, depth, Eff_Claws_Teleport);
			weight = 0;
			x = ring1.x;
			y = ring1.y;
			instance_destroy(ring1);
			sprite_index = Spr_Claws_Dive_startup;
			image_index = 0;
			action_alarm = generate_sprite_frames(sprite_index);
		}
		else if(!grounded){
			action = "8F";
			sprite_index = Spr_Claws_8F_startup;
			image_index = 0;
			action_alarm = generate_sprite_frames(sprite_index);
		}
		else if(down_backward_pressed){
			action = "H Ring Spawn";
			sprite_index = Spr_Claws_Skyring_startup;
			image_index = 0;
			action_alarm = generate_sprite_frames(sprite_index);
		}
		else if(half_circle_forward_pressed){
			action = "Claw Flurry";
			sprite_index = Spr_Claws_Flurry_startup;
			image_index = 0;
			action_alarm = generate_sprite_frames(sprite_index);
		}
		else if(down_hold){
			action = "2F";
			sprite_index = Spr_Claws_2F_startup;
			image_index = 0;
			action_alarm = generate_sprite_frames(sprite_index);
		}
		else{
			action = "5F";
			sprite_index = Spr_Claws_5F_startup;
			image_index = 0;
			action_alarm = generate_sprite_frames(sprite_index);
		}
	}
	else if(y_pressed){
		if(down_forward_pressed && instance_exists(ring2)){
			action = "Dive";
			instance_create_depth(x, y, depth, Eff_Claws_Teleport);
			weight = 0;
			x = ring2.x;
			y = ring2.y;
			instance_destroy(ring2);
			sprite_index = Spr_Claws_Dive_startup;
			image_index = 0;
			action_alarm = generate_sprite_frames(sprite_index);
		}
		else if(forward_down_pressed && instance_exists(ring2)){
			action = "Deep Dive";
			instance_create_depth(x, y, depth, Eff_Claws_Teleport);
			weight = 0;
			x = ring2.x;
			y = ring2.y;
			instance_destroy(ring2);
			sprite_index = Spr_Claws_Dive_startup;
			image_index = 0;
			action_alarm = generate_sprite_frames(sprite_index);
		}
		else if(!grounded){
			action = "8L";
			h_velocity = 4*image_xscale;
			v_velocity = -2;
			sprite_index = Spr_Claws_8L_startup;
			image_index = 0;
			action_alarm = generate_sprite_frames(sprite_index);
		}
		else if(half_circle_forward_pressed){
			action = "Penguin";
			sprite_index = Spr_Claws_Penguin_startup;
			image_index = 0;
			action_alarm = generate_sprite_frames(sprite_index);
		}
		else if(down_backward_pressed){
			action = "V Ring Spawn";
			sprite_index = Spr_Claws_Skyring_startup;
			image_index = 0;
			action_alarm = generate_sprite_frames(sprite_index);
		}
		else if(down_hold){
			action = "2L";
			sprite_index = Spr_Claws_2L_startup;
			image_index = 0;
			action_alarm = generate_sprite_frames(sprite_index);
		}
		else{
			action = "5L";
			sprite_index = Spr_Claws_5L_startup;
			image_index = 0;
			action_alarm = generate_sprite_frames(sprite_index);
		}
	}
	else if(b_pressed){
		if(!grounded){
			action = "8S";
			sprite_index = Spr_Claws_8S_startup;
			image_index = 0;
			action_alarm = generate_sprite_frames(sprite_index);
		}
		else if(half_circle_forward_pressed){
			action = "High";
			sprite_index = Spr_Claws_High_startup;
			image_index = 0;
			action_alarm = generate_sprite_frames(sprite_index);
		}
		else if(half_circle_backward_pressed){
			action = "Sweep";
			sprite_index = Spr_Claws_Sweep_startup;
			image_index = 0;
			action_alarm = generate_sprite_frames(sprite_index);
		}
		else if(down_hold){
			action = "2S";
			h_velocity += 6*image_xscale;
			sprite_index = Spr_Claws_2S_startup;
			image_index = 0;
			action_alarm = generate_sprite_frames(sprite_index);
		}
		else{
			action = "5S";
			sprite_index = Spr_Claws_5S_startup;
			image_index = 0;
			action_alarm = generate_sprite_frames(sprite_index);
		}
	}
	else if(rb_pressed){
		if(half_circle_forward_pressed && meter >= 100){
			action = "ULTRA";
			meter -= 100;
			shake_amount = 16;
			global.game_time = 0.5;
			eff = instance_create_depth(x, y, depth, Eff_Ring);
			eff.grow *= 8;
			action_alarm = 4;
		}
		else if(meter >= 25){
			action = "X";
			meter -= 25;
			
			sprite_index = Spr_Claws_Teleport_startup;
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
