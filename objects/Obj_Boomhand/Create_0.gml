event_inherited();

#region Sprites
stand_spr = Spr_Boomhand_Stand;
forward_spr = Spr_Boomhand_Forward;
backward_spr = Spr_Boomhand_Backward;
dash_forward_spr = Spr_Boomhand_Dash_Forward;
dash_backward_spr = Spr_Boomhand_Dash_Backward;
crouch_spr = Spr_Boomhand_Crouch;
ascend_spr = Spr_Boomhand_Ascend;
descend_spr = Spr_Boomhand_Descend;
stunned_spr = Spr_Boomhand_Stunned;
launched_spr = Spr_Boomhand_Launched;
land_spr = Spr_Boomhand_Land;
block_spr = Spr_Boomhand_Block;
crouch_block_spr = Spr_Boomhand_Crouch_Block;
#endregion

#region Stats
start_speed = 4;
max_speed = 5;
acceleration = 0.1;
dash_speed = 9;
dash_blink = 20;
dash_duration = 24;
dash_grip = 1;
grip = global.steady_grip;
air_grip = 0;
jump_power = 9;
mini_jump_power = 0.6; // % based
extra_jump_strength = 0.8; // % based
extra_jumps = 2;
extra_jumps_left = extra_jumps;
weight = global.standard_weight;
max_fall_speed = 16;
character_width = 24;
character_height = global.standard_height;
// Original stats
original_grip = grip;
original_air_grip = air_grip;
original_weight = weight;
#endregion

// Boomhand stuff
smoke_max_cd = 4;
smoke_cd = 0;
roars = 0;
hook_charge = 0;


action_trigger = function(){
	// Normal moves
	if(action == "8F"){
		attack = instance_create_depth(x, y, 0, Obj_Boomhand_8F_hitbox);
		attack.initiate(self);
		
		h_velocity = 4*image_xscale;
		v_velocity = -1;
		
		sprite_index = Spr_Boomhand_8F_recovery;
		image_index = 0;
		recover_alarm = generate_sprite_frames(sprite_index);
	}
	else if(action == "2F"){
		attack = instance_create_depth(x, y, 0, Obj_Boomhand_2F_hitbox);
		attack.initiate(self);
		
		sprite_index = Spr_Boomhand_2F_recovery;
		image_index = 0;
		recover_alarm = generate_sprite_frames(sprite_index);
	}
	else if(action == "5F"){
		attack = instance_create_depth(x, y, 0, Obj_Boomhand_5F_hitbox);
		attack.initiate(self);
		
		sprite_index = Spr_Boomhand_5F_recovery;
		image_index = 0;
		recover_alarm = generate_sprite_frames(sprite_index);
	}
	else if(action == "8L"){
		attack = instance_create_depth(x, y, 0, Obj_Boomhand_8L_hitbox);
		attack.initiate(self);
		
		h_velocity = 1.5*image_xscale;
		v_velocity = -6;
		
		sprite_index = Spr_Boomhand_8L_recovery;
		image_index = 0;
		recover_alarm = generate_sprite_frames(sprite_index);
	}
	else if(action == "2L"){
		attack = instance_create_depth(x, y, 0, Obj_Boomhand_2L_hitbox);
		attack.initiate(self);
		
		blink_h(-64*image_xscale, true);
		
		sprite_index = Spr_Boomhand_2L_recovery;
		image_index = 0;
		recover_alarm = generate_sprite_frames(sprite_index);
	}
	else if(action == "5L"){
		attack = instance_create_depth(x, y, 0, Obj_Boomhand_5L_hitbox);
		attack.initiate(self);
		
		sprite_index = Spr_Boomhand_5L_recovery;
		image_index = 0;
		recover_alarm = generate_sprite_frames(sprite_index);
	}
	else if(action == "8S"){
		attack = instance_create_depth(x, y, 0, Obj_Boomhand_8S_hitbox);
		attack.initiate(self);
		
		sprite_index = Spr_Boomhand_8S_recovery;
		image_index = 0;
		recover_alarm = generate_sprite_frames(sprite_index);
	}
	else if(action == "2S"){
		if(b_hold){
			blink_h(96*image_xscale, false);
		}
		
		attack = instance_create_depth(x, y, 0, Obj_Boomhand_2S_hitbox);
		attack.initiate(self);
		
		h_velocity = 2*image_xscale;
		v_velocity = -8;
		
		sprite_index = Spr_Boomhand_2S_recovery;
		image_index = 0;
		recover_alarm = generate_sprite_frames(sprite_index);
	}
	else if(action == "5S"){
		attack = instance_create_depth(x, y, 0, Obj_Boomhand_5S_hitbox);
		attack.initiate(self);
		
		sprite_index = Spr_Boomhand_5S_recovery;
		image_index = 0;
		recover_alarm = generate_sprite_frames(sprite_index);
	}
	// Special moves
	else if(action == "High"){
		attack = instance_create_depth(x, y, 0, Obj_Boomhand_High_hitbox);
		attack.initiate(self);
		
		sprite_index = Spr_Boomhand_High_recovery;
		image_index = 0;
		recover_alarm = generate_sprite_frames(sprite_index);
	}
	else if(action == "Sweep"){
		attack = instance_create_depth(x, y, 0, Obj_Boomhand_Sweep_hitbox);
		attack.initiate(self);
		
		sprite_index = Spr_Boomhand_Sweep_recovery;
		image_index = 0;
		recover_alarm = generate_sprite_frames(sprite_index);
	}
	else if(action == "Roar"){
		roars += 1;
		
		sprite_index = Spr_Boomhand_Roar_recovery;
		image_index = 0;
		recover_alarm = generate_sprite_frames(sprite_index);
	}
	else if(action == "Groundsmash"){
		attack = instance_create_depth(x, y, 0, Obj_Boomhand_Groundsmash_hitbox);
		attack.initiate(self);
		
		sprite_index = Spr_Boomhand_Groundsmash_recovery;
		image_index = 0;
		recover_alarm = generate_sprite_frames(sprite_index);
	}
	else if(action == "Backstep"){		
		sprite_index = Spr_Boomhand_Backstep_recovery;
		image_index = 0;
		
		if(y_hold){
			action = "BackstepBOOM";
			action_alarm = 4;
		}
		else{
			recover_alarm = generate_sprite_frames(sprite_index);
		}
	}
	else if(action == "BackstepBOOM"){
		attack = instance_create_depth(x, y, 0, Obj_Boomhand_BackstepBOOM_hitbox);
		attack.initiate(self);
		
		h_velocity = 16*image_xscale;
		
		sprite_index = Spr_Boomhand_BackstepBOOM_recovery;
		image_index = 0;
		recover_alarm = generate_sprite_frames(sprite_index);
	}
	else if(action == "Fistdive"){
		attack = instance_create_depth(x, y, 0, Obj_Boomhand_Fistdive_hitbox);
		attack.initiate(self);
		
		h_velocity = 12*image_xscale;
		v_velocity = 12;
		weight = 0.1;
		grip = 2;
		
		sprite_index = Spr_Boomhand_Fistdive_recovery;
		image_index = 0;
		recover_alarm = generate_sprite_frames(sprite_index);
	}
	// Meter moves
	else if(action == "ULTRA"){
		action = noone;
		is_invincible = true;
		invincibility_alarm = 360;
	}
	else{
		action = noone;
	}
}