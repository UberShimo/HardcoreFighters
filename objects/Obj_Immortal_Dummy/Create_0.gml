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
HP = 100;
max_HP = HP;
#endregion

action_trigger = function(){
	// Normal moves
	if(action == "8F"){
		attack = instance_create_depth(x, y, 0, Obj_Batman_8F_hitbox);
		attack.initiate(self);
		
		sprite_index = Spr_Batman_8F_recovery;
		image_index = 0;
		recover_alarm = generate_sprite_frames(sprite_index);
	}
	else if(action == "2F"){
		attack = instance_create_depth(x, y, 0, Obj_Batman_2F_hitbox);
		attack.initiate(self);
		
		sprite_index = Spr_Batman_2F_recovery;
		image_index = 0;
		recover_alarm = generate_sprite_frames(sprite_index);
	}
	else if(action == "5F"){
		attack = instance_create_depth(x, y, 0, Obj_Batman_5F_hitbox);
		attack.initiate(self);
		
		sprite_index = Spr_Batman_5F_recovery;
		image_index = 0;
		recover_alarm = generate_sprite_frames(sprite_index);
	}
	else if(action == "8L"){
		attack = instance_create_depth(x, y, 0, Obj_Batman_8L_hitbox);
		attack.initiate(self);
		
		sprite_index = Spr_Batman_8L_recovery;
		image_index = 0;
		recover_alarm = generate_sprite_frames(sprite_index);
	}
	else if(action == "2L"){
		if(multi_hit_action_index == 0){
			attack = instance_create_depth(x, y, 0, Obj_Batman_2L_hitbox);
			attack.initiate(self);
		
			sprite_index = Spr_Batman_2L_recovery;
			image_index = 0;
			recover_alarm = generate_sprite_frames(sprite_index);
			action_alarm = 8;
			multi_hit_action_index += 1;
		}
		else if(multi_hit_action_index == 1){
			attack = instance_create_depth(x, y, 0, Obj_Batman_2L_hitbox);
			attack.initiate(self);
		}
	}
	else if(action == "5L"){
		attack = instance_create_depth(x, y, 0, Obj_Batman_5L_hitbox);
		attack.initiate(self);
		
		sprite_index = Spr_Batman_5L_recovery;
		image_index = 0;
		recover_alarm = generate_sprite_frames(sprite_index);
	}
	else if(action == "8S"){
		attack = instance_create_depth(x, y, 0, Obj_Batman_8S_hitbox);
		attack.initiate(self);
		
		sprite_index = Spr_Batman_8S_recovery;
		image_index = 0;
		recover_alarm = generate_sprite_frames(sprite_index);
	}
	else if(action == "2S"){
		attack = instance_create_depth(x, y, 0, Obj_Batman_2S_hitbox);
		attack.initiate(self);
		
		sprite_index = Spr_Batman_2S_recovery;
		image_index = 0;
		recover_alarm = generate_sprite_frames(sprite_index);
	}
	else if(action == "5S"){
		attack = instance_create_depth(x, y, 0, Obj_Batman_5S_hitbox);
		attack.initiate(self);
		tip = instance_create_depth(x, y, 0, Obj_Batman_5S_tip_hitbox);
		tip.initiate(self);
		
		sprite_index = Spr_Batman_5S_recovery;
		image_index = 0;
		recover_alarm = generate_sprite_frames(sprite_index);
	}
	// Special moves
	else if(action == "426S"){
		attack = instance_create_depth(x, y, 0, Obj_Batman_High_hitbox);
		attack.initiate(self);
		
		sprite_index = Spr_Batman_High_recovery;
		image_index = 0;
		recover_alarm = generate_sprite_frames(sprite_index);
	}
	else if(action == "624S"){
		attack = instance_create_depth(x, y, 0, Obj_Batman_Sweep_hitbox);
		attack.initiate(self);
		
		h_velocity = -8*image_xscale;
		sprite_index = Spr_Batman_Sweep_recovery;
		image_index = 0;
		recover_alarm = generate_sprite_frames(sprite_index);
	}
	// Meter moves
	else if(action == "426X"){
		attack = instance_create_depth(x, y, 0, Obj_Batman_ULTRA_hitbox);
		attack.initiate(self);
		
		sprite_index = Spr_Batman_ULTRA_recovery;
		image_index = 0;
		recover_alarm = generate_sprite_frames(sprite_index);
	}
}