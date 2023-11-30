event_inherited();

#region Sprites
stand_spr = Spr_Claws_Stand;
forward_spr = Spr_Claws_Forward;
backward_spr = Spr_Claws_Backward;
dash_forward_spr = Spr_Claws_Dash_Forward;
dash_backward_spr = Spr_Claws_Dash_Backward;
crouch_spr = Spr_Claws_Crouch;
ascend_spr = Spr_Claws_Ascend;
descend_spr = Spr_Claws_Descend;
stunned_spr = Spr_Claws_Stunned;
launched_spr = Spr_Claws_Launched;
land_spr = Spr_Claws_Land;
block_spr = Spr_Claws_Block;
crouch_block_spr = Spr_Claws_Crouch_Block;
#endregion

#region Stats
start_speed = 2;
max_speed = 7;
acceleration = 0.4;
dash_speed = 8;
dash_blink = 54;
dash_duration = 24;
dash_grip = 1;
grip = global.slippy_grip;
air_grip = 0;
jump_power = 12;
mini_jump_power = 0.6; // % based
extra_jump_strength = 0.8; // % based
extra_jumps = 1;
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

// Claws related
ring1 = noone;
ring2 = noone;
is_hypermode = false;

action_trigger = function(){
	// Normal moves
	if(action == "8F"){
		if(multi_hit_action_index == 0){
			attack = instance_create_depth(x, y, 0, Obj_Claws_8F_hitbox);
			attack.initiate(self);
		
			sprite_index = Spr_Claws_8F_recovery;
			image_index = 0;
			recover_alarm = generate_sprite_frames(sprite_index);
			action_alarm = 12;
			multi_hit_action_index += 1;
		}
		else if(multi_hit_action_index == 1){
			attack = instance_create_depth(x, y, 0, Obj_Batman_8F_hitbox);
			attack.initiate(self);
		}
	}
	else if(action == "2F"){
		attack = instance_create_depth(x, y, 0, Obj_Claws_2F_hitbox);
		attack.initiate(self);
		
		sprite_index = Spr_Claws_2F_recovery;
		image_index = 0;
		recover_alarm = generate_sprite_frames(sprite_index);
	}
	else if(action == "5F"){
		attack = instance_create_depth(x, y, 0, Obj_Claws_5F_hitbox);
		attack.initiate(self);
		
		sprite_index = Spr_Claws_5F_recovery;
		image_index = 0;
		recover_alarm = generate_sprite_frames(sprite_index);
	}
	else if(action == "8L"){
		attack = instance_create_depth(x, y, 0, Obj_Claws_8L_hitbox);
		attack.initiate(self);
		
		sprite_index = Spr_Claws_8L_recovery;
		image_index = 0;
		recover_alarm = generate_sprite_frames(sprite_index);
	}
	else if(action == "2L"){
		attack = instance_create_depth(x, y, 0, Obj_Claws_2L_hitbox);
		attack.initiate(self);
		
		sprite_index = Spr_Claws_2L_recovery;
		image_index = 0;
		recover_alarm = generate_sprite_frames(sprite_index);
	}
	else if(action == "5L"){
		attack = instance_create_depth(x, y, 0, Obj_Claws_5L_hitbox);
		attack.initiate(self);
		
		blink_h(28*image_xscale);
		sprite_index = Spr_Claws_5L_recovery;
		image_index = 0;
		recover_alarm = generate_sprite_frames(sprite_index);
	}
	else if(action == "8S"){
		attack = instance_create_depth(x, y, 0, Obj_Claws_8S_hitbox);
		attack.initiate(self);
		
		sprite_index = Spr_Claws_8S_recovery;
		image_index = 0;
		recover_alarm = generate_sprite_frames(sprite_index);
	}
	else if(action == "2S"){
		attack = instance_create_depth(x, y, 0, Obj_Claws_2S_hitbox);
		attack.initiate(self);
		
		sprite_index = Spr_Claws_2S_recovery;
		image_index = 0;
		recover_alarm = generate_sprite_frames(sprite_index);
	}
	else if(action == "5S"){
		attack = instance_create_depth(x, y, 0, Obj_Batman_5S_hitbox);
		attack.initiate(self);
		
		sprite_index = Spr_Claws_5S_recovery;
		image_index = 0;
		recover_alarm = generate_sprite_frames(sprite_index);
	}
	// Special moves
	else if(action == "24F"){
		if(ring1 != noone){
			instance_destroy(ring1);
		}
		ring1 = instance_create_depth(x, y, 0, Obj_Claws_Skyring);
		ring1.h_velocity = -3*image_xscale;
		ring1.h_acceleration *= image_xscale;
		ring1.v_velocity = -1.5;
		ring1.weight *= 0.25;
		
		sprite_index = Spr_Claws_Skyring_recovery;
		image_index = 0;
		recover_alarm = generate_sprite_frames(sprite_index);
	}
	else if(action == "24L"){
		if(ring2 != noone){
			instance_destroy(ring2);
		}
		ring2 = instance_create_depth(x, y, 0, Obj_Claws_Skyring);
		ring2.h_velocity = -1*image_xscale;
		ring2.h_acceleration *= 0.5*image_xscale;
		ring2.v_velocity = -3;
		ring2.max_speed = 2;
		
		sprite_index = Spr_Claws_Skyring_recovery;
		image_index = 0;
		recover_alarm = generate_sprite_frames(sprite_index);
	}
	else if(action == "26F" || action == "26L"){
		attack = instance_create_depth(x, y, 0, Obj_Claws_Dive_hitbox);
		attack.initiate(self);
		
		h_velocity = 12*image_xscale;
		v_velocity = 12;
		grip = 1;
		
		sprite_index = Spr_Claws_Dive_recovery;
		image_index = 0;
		recover_alarm = generate_sprite_frames(sprite_index);
	}
	else if(action == "62F" || action == "62L"){
		attack = instance_create_depth(x, y, 0, Obj_Claws_Deepdive_hitbox);
		attack.initiate(self);
		
		h_velocity = 8*image_xscale;
		v_velocity = 16;
		grip = 1;
		
		sprite_index = Spr_Claws_Deepdive_recovery;
		image_index = 0;
		recover_alarm = generate_sprite_frames(sprite_index);
	}
	else if(action == "426S"){
		attack = instance_create_depth(x, y, 0, Obj_Claws_High_hitbox);
		attack.initiate(self);
		
		sprite_index = Spr_Claws_High_recovery;
		image_index = 0;
		recover_alarm = generate_sprite_frames(sprite_index);
	}
	else if(action == "624S"){
		attack = instance_create_depth(x, y, 0, Obj_Claws_Sweep_hitbox);
		attack.initiate(self);
		
		sprite_index = Spr_Claws_Sweep_recovery;
		image_index = 0;
		recover_alarm = generate_sprite_frames(sprite_index);
	}
	// Meter moves
	else if(action == "426X"){
		is_hypermode = true;
		shake_amount = 0;
		
		sprite_index = stand_spr;
		image_index = 0;
		recover_alarm = 1;
		alarm[10] = 300; // global Time reset alarm
	}
	else if(action == "X"){
		action = noone;
		
		instance_create_depth(x, y, depth, Eff_Claws_Teleport);
		x = closest_enemy.x + 24*image_xscale;
		y = closest_enemy.y - 32;
		h_velocity = 0;
		v_velocity = -4;
		face_closest_enemy();
	}
}