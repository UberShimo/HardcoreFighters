event_inherited();

#region Sprites
stand_spr = Spr_Baller_Stand;
forward_spr = Spr_Baller_Forward;
backward_spr = Spr_Baller_Backward;
dash_forward_spr = Spr_Baller_Dash_Forward;
dash_backward_spr = Spr_Baller_Dash_Backward;
crouch_spr = Spr_Baller_Crouch;
ascend_spr = Spr_Baller_Ascend;
descend_spr = Spr_Baller_Descend;
stunned_spr = Spr_Baller_Stunned;
launched_spr = Spr_Baller_Launched;
land_spr = Spr_Baller_Land;
block_spr = Spr_Baller_Block;
crouch_block_spr = Spr_Baller_Crouch_Block;
#endregion

#region Stats
start_speed = 3.5;
max_speed = 5;
acceleration = 0.2;
dash_speed = 10;
dash_blink = 8;
dash_duration = 24;
dash_grip = 1;
grip = global.standard_grip;
air_grip = 0;
jump_power = 11;
mini_jump_power = 0.6; // % based
extra_jump_strength = 0.8; // % based
extra_jumps = 1;
extra_jumps_left = extra_jumps;
weight = global.standard_weight;
max_fall_speed = 16;
character_width = 24;
character_height = global.short_height;
// Original stats
original_grip = grip;
original_air_grip = air_grip;
original_weight = weight;
#endregion

// Baller related
is_holding_ball = true;
ball = instance_create_depth(x, y, depth-1, Obj_Baller_Ball);
ball.spawner = self;
ball_fall_eff_counter = 0; // Used so eff dont fuck up in slowmo
ball_explosion_max_cd = 90;
ball_explosion_cd = ball_explosion_max_cd;

action_trigger = function(){
	// Normal moves
	if(action == "8F"){
		attack = instance_create_depth(x, y, 0, Obj_Baller_8F_hitbox);
		attack.initiate(self);
		attack2 = instance_create_depth(x, y, 0, Obj_Baller_8F_hitbox);
		attack2.initiate(self);
		attack2.image_xscale *= -1;
		
		sprite_index = Spr_Baller_8F_recovery;
		image_index = 0;
		recover_alarm = generate_sprite_frames(sprite_index);
	}
	else if(action == "2F"){
		attack = instance_create_depth(x, y, 0, Obj_Baller_2F_hitbox);
		attack.initiate(self);
		
		sprite_index = Spr_Baller_2F_recovery;
		image_index = 0;
		recover_alarm = generate_sprite_frames(sprite_index);
	}
	else if(action == "5F"){
		attack = instance_create_depth(x, y, 0, Obj_Baller_5F_hitbox);
		attack.initiate(self);
		h_velocity += 4*image_xscale;
		
		sprite_index = Spr_Baller_5F_recovery;
		image_index = 0;
		recover_alarm = generate_sprite_frames(sprite_index);
	}
	else if(action == "8L"){
		if(multi_hit_action_index == 0){
			attack = instance_create_depth(x, y, 0, Obj_Baller_8L_hitbox);
			attack.initiate(self);
		
			sprite_index = Spr_Baller_8L_recovery;
			image_index = 0;
			recover_alarm = generate_sprite_frames(sprite_index);
			action_alarm = 4;
			multi_hit_action_index += 1;
		}
		else if(multi_hit_action_index < 3){
			attack = instance_create_depth(x, y, 0, Obj_Baller_8L_hitbox);
			attack.initiate(self);
			action_alarm = 4;
			multi_hit_action_index += 1;
		}
	}
	else if(action == "2L"){
		attack = instance_create_depth(x, y, 0, Obj_Baller_2L_hitbox);
		attack.initiate(self);
		
		sprite_index = Spr_Baller_2L_recovery;
		image_index = 0;
		recover_alarm = generate_sprite_frames(sprite_index);
	}
	else if(action == "5L"){
		attack = instance_create_depth(x, y, 0, Obj_Baller_5L_hitbox);
		attack.initiate(self);
		
		sprite_index = Spr_Baller_5L_recovery;
		image_index = 0;
		recover_alarm = generate_sprite_frames(sprite_index);
	}
	else if(action == "8S"){
		// Turn around?
		if(forward_hold){
			image_xscale *= -1;
		}
		is_holding_ball = false;
		
		ball.h_velocity = 2*image_xscale;
		ball.v_velocity = 8;
		
		h_velocity = -start_speed*image_xscale;
		v_velocity = -jump_power*extra_jump_strength;
		
		sprite_index = Spr_Baller_8S_recovery;
		image_index = 0;
		recover_alarm = generate_sprite_frames(sprite_index);
	}
	else if(action == "2S"){
		if(is_holding_ball){
			is_holding_ball = false;
			
			ball.h_velocity = 2.5*image_xscale;
			ball.v_velocity = -14;
		}
		else{
			attack = instance_create_depth(x, y, 0, Obj_Baller_2S_hitbox);
			attack.initiate(self);
		}
		
		sprite_index = Spr_Baller_2S_recovery;
		image_index = 0;
		recover_alarm = generate_sprite_frames(sprite_index);
	}
	else if(action == "5S"){
		is_holding_ball = false;
		
		if(b_hold){
			ball.h_velocity = 12*image_xscale;
			ball.v_velocity = -6;
		}
		else{
			ball.h_velocity = 6*image_xscale;
			ball.v_velocity = -8;
		}
		
		sprite_index = Spr_Baller_5S_recovery;
		image_index = 0;
		recover_alarm = generate_sprite_frames(sprite_index);
	}
	// Special moves
	else if(action == "High"){
		attack = instance_create_depth(x, y, 0, Obj_Baller_High_hitbox);
		attack.initiate(self);
		
		sprite_index = Spr_Baller_High_recovery;
		image_index = 0;
		recover_alarm = generate_sprite_frames(sprite_index);
	}
	else if(action == "Sweep"){
		attack = instance_create_depth(x, y, 0, Obj_Baller_Sweep_hitbox);
		attack.initiate(self);
		
		sprite_index = Spr_Baller_Sweep_recovery;
		image_index = 0;
		recover_alarm = generate_sprite_frames(sprite_index);
	}
	else if(action == "Pull"){
		ball.is_returning = true;
		
		sprite_index = Spr_Baller_Ballpull_recovery;
		image_index = 0;
		recover_alarm = generate_sprite_frames(sprite_index);
	}
	else if(action == "Ballsmash"){
		attack = instance_create_depth(x, y, 0, Obj_Baller_Ballsmash_hitbox);
		attack.initiate(self);
		
		h_velocity = 0;
		v_velocity = 12;
		sprite_index = Spr_Baller_Ballsmash_recovery;
		image_index = 0;
		recover_alarm = generate_sprite_frames(sprite_index);
	}
	else if(action == "Balldash"){
		// Face toward ball
		if(x > ball.x){
			image_xscale = -1;
		}
		else{
			image_xscale = 1;
		}
		attack = instance_create_depth(x, y, 0, Obj_Baller_Balldash_hitbox);
		attack.initiate(self);
		
		is_collidable = false;
		
		sprite_index = Spr_Baller_Balldash_recovery;
		image_index = 0;
	}
	// Meter moves
	else if(action == "ULTRA"){
		ball.weight = ball.original_weight;
		ball.v_velocity = 12;
		ball.armageddon_is_coming = true;
		ball.shake_amount = 0;
		
		shake_amount = 0;
		
		sprite_index = Spr_Baller_ULTRA_recovery;
		image_index = 0;
		recover_alarm = generate_sprite_frames(sprite_index);
	}
	else{
		action = noone;
	}
}