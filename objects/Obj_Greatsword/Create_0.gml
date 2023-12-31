event_inherited();

#region Sprites
stand_spr = Spr_Greatsword_Stand;
forward_spr = Spr_Greatsword_Forward;
backward_spr = Spr_Greatsword_Backward;
dash_forward_spr = Spr_Greatsword_Dash_Forward;
dash_backward_spr = Spr_Greatsword_Dash_Backward;
crouch_spr = Spr_Greatsword_Crouch;
ascend_spr = Spr_Greatsword_Ascend;
descend_spr = Spr_Greatsword_Descend;
stunned_spr = Spr_Greatsword_Stunned;
launched_spr = Spr_Greatsword_Launched;
land_spr = Spr_Greatsword_Land;
block_spr = Spr_Greatsword_Block;
crouch_block_spr = Spr_Greatsword_Crouch_Block;
#endregion

#region Stats
start_speed = 3;
max_speed = 5;
acceleration = 0.15;
dash_speed = 10;
dash_blink = 0;
dash_duration = 24;
dash_grip = 0.5;
grip = global.standard_grip;
air_grip = 0;
jump_power = 14;
mini_jump_power = 0.6; // % based
extra_jump_strength = 0.8; // % based
extra_jumps = 1;
extra_jumps_left = extra_jumps;
weight = global.heavy_weight;
max_fall_speed = 16;
character_width = 24;
character_height = global.standard_height;
// Original stats
original_grip = grip;
original_air_grip = air_grip;
original_weight = weight;
#endregion

// Greatsword stuff
pillar_distance = 0;

action_trigger = function(){
	// Normal moves
	if(action == "8F"){
		attack = instance_create_depth(x, y, 0, Obj_Greatsword_8F_hitbox);
		attack.initiate(self);
		
		sprite_index = Spr_Greatsword_8F_recovery;
		image_index = 0;
		recover_alarm = generate_sprite_frames(sprite_index);
	}
	else if(action == "2F"){
		attack = instance_create_depth(x, y, 0, Obj_Greatsword_2F_hitbox);
		attack.initiate(self);
		
		sprite_index = Spr_Greatsword_2F_recovery;
		image_index = 0;
		recover_alarm = generate_sprite_frames(sprite_index);
	}
	else if(action == "5F"){
		attack = instance_create_depth(x, y, 0, Obj_Greatsword_5F_hitbox);
		attack.initiate(self);
		
		sprite_index = Spr_Greatsword_5F_recovery;
		image_index = 0;
		recover_alarm = generate_sprite_frames(sprite_index);
	}
	else if(action == "8L"){
		attack = instance_create_depth(x, y, 0, Obj_Greatsword_8L_hitbox);
		attack.initiate(self);
		
		sprite_index = Spr_Greatsword_8L_recovery;
		image_index = 0;
		recover_alarm = generate_sprite_frames(sprite_index);
	}
	else if(action == "2L"){
		attack = instance_create_depth(x, y, 0, Obj_Greatsword_2L_hitbox);
		attack.initiate(self);
		
		sprite_index = Spr_Greatsword_2L_recovery;
		image_index = 0;
		recover_alarm = generate_sprite_frames(sprite_index);
	}
	else if(action == "5L"){
		attack = instance_create_depth(x, y, 0, Obj_Greatsword_5L_hitbox);
		attack.initiate(self);
		
		sprite_index = Spr_Greatsword_5L_recovery;
		image_index = 0;
		recover_alarm = generate_sprite_frames(sprite_index);
	}
	else if(action == "8S"){
		attack = instance_create_depth(x, y, 0, Obj_Greatsword_8S_hitbox);
		attack.initiate(self);
		
		sprite_index = Spr_Greatsword_8S_recovery;
		image_index = 0;
		recover_alarm = generate_sprite_frames(sprite_index);
	}
	else if(action == "2S"){
		attack = instance_create_depth(x, y, 0, Obj_Greatsword_2S_hitbox);
		attack.initiate(self);
		
		sprite_index = Spr_Greatsword_2S_recovery;
		image_index = 0;
		recover_alarm = generate_sprite_frames(sprite_index);
	}
	else if(action == "5S"){
		attack = instance_create_depth(x, y, 0, Obj_Greatsword_5S_hitbox);
		attack.initiate(self);
		
		sprite_index = Spr_Greatsword_5S_recovery;
		image_index = 0;
		recover_alarm = generate_sprite_frames(sprite_index);
	}
	// Special moves
	else if(action == "426S"){
		attack = instance_create_depth(x, y, 0, Obj_Greatsword_High_hitbox);
		attack.initiate(self);
		
		sprite_index = Spr_Greatsword_High_recovery;
		image_index = 0;
		recover_alarm = generate_sprite_frames(sprite_index);
	}
	else if(action == "624S"){
		attack = instance_create_depth(x, y, 0, Obj_Greatsword_Sweep_hitbox);
		attack.initiate(self);
		
		h_velocity = -8*image_xscale;
		sprite_index = Spr_Greatsword_Sweep_recovery;
		image_index = 0;
		recover_alarm = generate_sprite_frames(sprite_index);
	}
	else if(action == "stomp"){
		pillar = instance_create_depth(x, y, depth+1, Obj_Greatsword_Pillar);
		pillar.spawner = self;
		pillar.image_xscale = -image_xscale;
		pillar.x += pillar_distance*image_xscale;
		
		if(x_hold || y_hold || b_hold){
			pillar.action_alarm = 90;
		}
		
		sprite_index = Spr_Greatsword_Stomp_recovery;
		image_index = 0;
		recover_alarm = generate_sprite_frames(sprite_index);
	}
	else if(action == "earth_start"){
		action = "earth";
		
		sprite_index = Spr_Greatsword_Earth_recovery;
		image_index = 0;
		recover_alarm = generate_sprite_frames(sprite_index);
	}
	else if(action == "ocean_start"){
		action = "ocean";
		
		sprite_index = Spr_Greatsword_Ocean_recovery;
		image_index = 0;
		recover_alarm = generate_sprite_frames(sprite_index);
	}
	else if(action == "heaven_start"){
		action = "heaven";
		
		sprite_index = Spr_Greatsword_Heaven_recovery;
		image_index = 0;
		recover_alarm = generate_sprite_frames(sprite_index);
	}
	// Ughhhhh stance actions...
	else if(action == "earth_F"){
		attack = instance_create_depth(x, y, 0, Obj_Greatsword_Earth_F_hitbox);
		attack.initiate(self);
		
		sprite_index = Spr_Greatsword_Earth_F_recovery;
		image_index = 0;
		recover_alarm = generate_sprite_frames(sprite_index);
	}
	else if(action == "earth_L"){
		attack = instance_create_depth(x, y, 0, Obj_Greatsword_Earth_L_hitbox);
		attack.initiate(self);
		
		sprite_index = Spr_Greatsword_Earth_L_recovery;
		image_index = 0;
		recover_alarm = generate_sprite_frames(sprite_index);
	}
	else if(action == "earth_S"){
		attack = instance_create_depth(x, y, 0, Obj_Greatsword_Earth_S_hitbox);
		attack.initiate(self);
		
		sprite_index = Spr_Greatsword_Earth_S_recovery;
		image_index = 0;
		recover_alarm = generate_sprite_frames(sprite_index);
	}
	else if(action == "ocean_F"){
		if(multi_hit_action_index == 0){
			attack = instance_create_depth(x, y, 0, Obj_Greatsword_Ocean_F_hitbox1);
			attack.initiate(self);
		
			sprite_index = Spr_Greatsword_Ocean_F_recovery;
			image_index = 0;
			recover_alarm = generate_sprite_frames(sprite_index);
			
			multi_hit_action_index += 1;
			action_alarm = 16;
		}
		else{
			attack = instance_create_depth(x, y, 0, Obj_Greatsword_Ocean_F_hitbox2);
			attack.initiate(self);
		}
	}
	else if(action == "ocean_L"){
		attack = instance_create_depth(x, y, 0, Obj_Greatsword_Ocean_L_hitbox);
		attack.initiate(self);
		
		sprite_index = Spr_Greatsword_Ocean_L_recovery;
		image_index = 0;
		recover_alarm = generate_sprite_frames(sprite_index);
	}
	else if(action == "ocean_S"){
		attack = instance_create_depth(x, y, 0, Obj_Greatsword_Ocean_S_hitbox);
		attack.initiate(self);
		
		sprite_index = Spr_Greatsword_Ocean_S_recovery;
		image_index = 0;
		recover_alarm = generate_sprite_frames(sprite_index);
	}
	else if(action == "heaven_F"){
		action = noone;
		
		h_velocity = start_speed*1.5*image_xscale;
		v_velocity = -5;
	}
	else if(action == "heaven_L"){
		attack = instance_create_depth(x, y, 0, Obj_Greatsword_Heaven_L_hitbox);
		attack.initiate(self);
		
		sprite_index = Spr_Greatsword_Heaven_L_recovery;
		image_index = 0;
		recover_alarm = generate_sprite_frames(sprite_index);
	}
	else if(action == "heaven_S"){
		attack = instance_create_depth(x, y, 0, Obj_Greatsword_Heaven_S_hitbox);
		attack.initiate(self);
		
		sprite_index = Spr_Greatsword_Heaven_S_recovery;
		image_index = 0;
		recover_alarm = generate_sprite_frames(sprite_index);
	}
	// Meter moves
	else if(action == "426X"){
		if(multi_hit_action_index < 8){
			action = "more smash";
			multi_hit_action_index += 1;
			
			attack = instance_create_depth(x, y, 0, Obj_Greatsword_ULTRA_hitbox);
			attack.initiate(self);
		
			sprite_index = Spr_Greatsword_ULTRA_recovery;
			image_index = 0;
			action_alarm = generate_sprite_frames(sprite_index);
		}
		else{
			attack = instance_create_depth(x, y, 0, Obj_Greatsword_ULTRA_hitbox);
			attack.initiate(self);
			
			sprite_index = Spr_Greatsword_ULTRA_recovery;
			image_index = 0;
			recover_alarm = generate_sprite_frames(sprite_index);
		}
	}
	else if(action == "more smash"){
		action = "426X";
		h_velocity = 4*image_xscale;
		
		sprite_index = Spr_Greatsword_ULTRA_more_smash;
		image_index = 0;
		action_alarm = generate_sprite_frames(sprite_index);
	}
	else if(action == "X"){
		attack = instance_create_depth(x, y, 0, Obj_Greatsword_X1_hitbox);
		attack.initiate(self);
		
		sprite_index = Spr_Greatsword_X_whiff;
		image_index = 0;
		recover_alarm = generate_sprite_frames(sprite_index);
	}
	else if(action == "X2"){
		attack = instance_create_depth(x, y, 0, Obj_Greatsword_X2_hitbox);
		attack.initiate(self);
	}
}