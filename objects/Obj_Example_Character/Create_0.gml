event_inherited();

// for test
for(i = 0; i < instance_number(Parent_Character); i++){
	if(instance_find(Parent_Character, i).id == id){
		index = i;
	}
}

#region Sprites
stand_spr = Spr_Batman_Stand;
forward_spr = Spr_Batman_Forward;
backward_spr = Spr_Batman_Backward;
dash_forward_spr = Spr_Batman_Dash_Forward;
dash_backward_spr = Spr_Batman_Dash_Backward;
crouch_spr = Spr_Batman_Crouch;
ascend_spr = Spr_Batman_Ascend;
descend_spr = Spr_Batman_Descend;
stunned_spr = Spr_Batman_Stunned;
launched_spr = Spr_Batman_Launched;
land_spr = Spr_Batman_Land;
block_spr = Spr_Batman_Block;
crouch_block_spr = Spr_Batman_Crouch_Block;
#endregion

action_trigger = function(){
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
	else if(action == "26S"){
		attack = instance_create_depth(x, y, 0, Obj_Batman_26S_hitbox);
		attack.initiate(self);
		
		sprite_index = Spr_Batman_26S_recovery;
		image_index = 0;
		recover_alarm = generate_sprite_frames(sprite_index);
	}
	else if(action == "24S"){
		attack = instance_create_depth(x, y, 0, Obj_Batman_24S_hitbox);
		attack.initiate(self);
		
		h_velocity = -8*image_xscale;
		sprite_index = Spr_Batman_24S_recovery;
		image_index = 0;
		recover_alarm = generate_sprite_frames(sprite_index);
	}
	else if(action == "426X"){
		attack = instance_create_depth(x, y, 0, Obj_Batman_426X_hitbox);
		attack.initiate(self);
		
		sprite_index = Spr_Batman_426X_recovery;
		image_index = 0;
		recover_alarm = generate_sprite_frames(sprite_index);
	}
}