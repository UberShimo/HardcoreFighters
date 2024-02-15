event_inherited();

#region Sprites
stand_spr = Spr_Dojo_Stand;
forward_spr = Spr_Dojo_Forward;
backward_spr = Spr_Dojo_Backward;
dash_forward_spr = Spr_Dojo_Dash_Forward;
dash_backward_spr = Spr_Dojo_Dash_Backward;
crouch_spr = Spr_Dojo_Crouch;
ascend_spr = Spr_Dojo_Ascend;
descend_spr = Spr_Dojo_Descend;
stunned_spr = Spr_Dojo_Stunned;
launched_spr = Spr_Dojo_Launched;
land_spr = Spr_Dojo_Land;
block_spr = Spr_Dojo_Block;
crouch_block_spr = Spr_Dojo_Crouch_Block;
#endregion

#region Stats
start_speed = 3;
max_speed = 6;
acceleration = 0.1;
dash_speed = 12;
dash_blink = 16;
dash_duration = 24;
dash_grip = 1;
grip = global.standard_grip;
air_grip = 0;
jump_power = 8;
mini_jump_power = 0.6; // % based
extra_jump_strength = 0.8; // % based
extra_jumps = 0;
extra_jumps_left = extra_jumps;
weight = 0.3;
max_fall_speed = 16;
character_width = 24;
character_height = global.standard_height;
// Original stats
original_grip = grip;
original_air_grip = air_grip;
original_weight = weight;
#endregion

// Dojo specific
is_doing_F_loop = false;
is_jumping = false;

action_trigger = function(){
	// Normal moves
	if(action == "F"){
		attack = instance_create_depth(x, y, 0, Obj_Dojo_F_hitbox);
		attack.initiate(self);
		
		sprite_index = Spr_Dojo_F_recovery;
		image_index = 0;
		recover_alarm = generate_sprite_frames(sprite_index);
	}
	else if(action == "L"){
		attack = instance_create_depth(x, y, 0, Obj_Dojo_L_hitbox);
		attack.initiate(self);
		
		sprite_index = Spr_Dojo_L_recovery;
		image_index = 0;
		recover_alarm = generate_sprite_frames(sprite_index);
	}
	else if(action == "S"){
		attack = instance_create_depth(x, y, 0, Obj_Dojo_S_hitbox);
		attack.initiate(self);
		
		sprite_index = Spr_Dojo_S_recovery;
		image_index = 0;
		recover_alarm = generate_sprite_frames(sprite_index);
	}
	else{
		action = noone;
	}
}