event_inherited();

// Balling baller
if(is_holding_ball){
	weight = global.heavy_weight;
	ball.x = x;
	ball.y = y;
	ball.h_velocity = 0;
	ball.v_velocity = 0;
}
else{
	weight = global.standard_weight;
}

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
		if(down_forward_pressed && !is_holding_ball){
			// Pick up ball
			if(place_meeting(x, y, ball)){
				is_holding_ball = true;
			}
			// Ball dash
			else{
				action = "balldash";
				h_velocity = 0;
				v_velocity = -4;
				ball.h_velocity = 0;
				ball.v_velocity = -4;
				ball.y -= 6;
				sprite_index = Spr_Baller_Balldash_startup;
				image_index = 0;
				action_alarm = generate_sprite_frames(sprite_index);
			}
		}
		// Drop ball
		else if(forward_down_pressed && is_holding_ball){
			is_holding_ball = false;
		}
		else if(!grounded){
			action = "8F";
			sprite_index = Spr_Baller_8F_startup;
			image_index = 0;
			action_alarm = generate_sprite_frames(sprite_index);
		}
		else if(down_hold){
			action = "2F";
			blink_h(4*image_xscale, false);
			h_velocity += 2*image_xscale;
			sprite_index = Spr_Baller_2F_startup;
			image_index = 0;
			action_alarm = generate_sprite_frames(sprite_index);
		}
		else{
			action = "5F";
			sprite_index = Spr_Baller_5F_startup;
			image_index = 0;
			action_alarm = generate_sprite_frames(sprite_index);
		}
	}
	else if(y_pressed){
		if(!grounded){
			action = "8L";
			sprite_index = Spr_Baller_8L_startup;
			image_index = 0;
			action_alarm = generate_sprite_frames(sprite_index);
			multi_hit_action_index = 0;
		}
		else if(down_hold){
			action = "2L";
			sprite_index = Spr_Baller_2L_startup;
			image_index = 0;
			action_alarm = generate_sprite_frames(sprite_index);
		}
		else{
			action = "5L";
			sprite_index = Spr_Baller_5L_startup;
			image_index = 0;
			action_alarm = generate_sprite_frames(sprite_index);
		}
	}
	else if(b_pressed){
		if(!grounded){
			if(is_holding_ball){
				if(down_hold){
					action = "ballsmash";
					v_velocity = -3;
					sprite_index = Spr_Baller_Ballsmash_startup;
					image_index = 0;
					action_alarm = generate_sprite_frames(sprite_index);
				}
				else{
					action = "8S";
					sprite_index = Spr_Baller_8S_startup;
					image_index = 0;
					action_alarm = generate_sprite_frames(sprite_index);
				}
			}
			else{
				// Pick up ball
				if(place_meeting(x, y, ball)){
					is_holding_ball = true;
				}
				// Pull ball
				else{
					action = "pull";
					ball.h_velocity = 0;
					ball.v_velocity = -5;
					ball.y -= 6;
					sprite_index = Spr_Baller_Ballpull_startup;
					image_index = 0;
					action_alarm = generate_sprite_frames(sprite_index);
				}
			}
		}
		else if(half_circle_forward_pressed){
			action = "426S";
			sprite_index = Spr_Baller_High_startup;
			image_index = 0;
			action_alarm = generate_sprite_frames(sprite_index);
		}
		else if(half_circle_backward_pressed){
			action = "624S";
			sprite_index = Spr_Baller_Sweep_startup;
			image_index = 0;
			action_alarm = generate_sprite_frames(sprite_index);
		}
		else if(down_hold){
			action = "2S";
			sprite_index = Spr_Baller_2S_startup;
			image_index = 0;
			action_alarm = generate_sprite_frames(sprite_index);
		}
		else{
			if(is_holding_ball){
				action = "5S";
				sprite_index = Spr_Baller_5S_startup;
				image_index = 0;
				action_alarm = generate_sprite_frames(sprite_index);
			}
			else{
				// Pick up ball
				if(place_meeting(x, y, ball)){
					is_holding_ball = true;
				}
				// Pull ball
				else{
					action = "pull";
					ball.h_velocity = 0;
					ball.v_velocity = -5;
					ball.y -= 6;
					sprite_index = Spr_Baller_Ballpull_startup;
					image_index = 0;
					action_alarm = generate_sprite_frames(sprite_index);
				}
			}
		}
	}
	else if(rb_pressed){
		if(half_circle_forward_pressed && meter >= 100){
			action = "426X";
			meter -= 100;
			
			is_holding_ball = false;
			shake_amount = 4;
			ball.weight = 0;
			ball.h_velocity = 0;
			ball.v_velocity = -8;
			ball.y -= 6;
			ball.shake_amount = 8;
			
			sprite_index = Spr_Baller_ULTRA_startup;
			image_index = 0;
			global.game_time = 0.25;
			action_alarm = generate_sprite_frames(sprite_index);
			alarm[10] = action_alarm*4;
			
			audio_play_sound(Snd_AP3, 0, false);
		}
		else if(meter >= 25 && ball_explosion_cd <= 0){
			meter -= 25;
			ball_explosion_cd = ball_explosion_max_cd;
			
			obj = instance_create_depth(0, 0, ball.depth-1, Obj_Ball_Exploder);
			obj.ball = ball;
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

// Ball explosion cd logic
if(ball_explosion_cd >= 0){
	ball_explosion_cd -= logic_time;
}

// Dash to ball
if(action == "balldash" && action_alarm <= 0){
	spd = 16;
	dir = point_direction(x, y, ball.x, ball.y);
	h_velocity = lengthdir_x(spd, dir);
	v_velocity = lengthdir_y(spd, dir);
	ball.h_velocity = 0;
	ball.v_velocity = 0;
	ball.weight = 0;
	
	// Catch ball!
	if(place_meeting(x, y, ball)){
		action = noone;
		is_holding_ball = true;
		h_velocity *= 0.25;
		v_velocity *= 0.25;
		
		if(attack != noone){
			instance_destroy(attack);
		}
		recover_alarm = 4;
	}
}
// Just reset ball weight
else{
	ball.weight = 0.5;
}

// Ballsmash effects ya know
if(action == "ballsmash"){
	if(!grounded){
		if(v_velocity > 8){
			instance_create_depth(x, y, depth-1, Eff_Baller_Ball);
			// Messy but looks sexy in slowmo
			ball_fall_eff_counter += logic_time;
			if(ball_fall_eff_counter >= 1){
				instance_create_depth(x, y, depth-1, Eff_Ball_Fall);
				ball_fall_eff_counter = 0;
			}
		}
	}
	else{
		instance_create_depth(x, y, depth, Eff_Ball_Land);
		action = "balland";
	}
}
else if(action == "balland"){	
	ball.y += 16;
}

// Hold ball if you respawn
if(is_respawning){
	is_holding_ball = true;
}