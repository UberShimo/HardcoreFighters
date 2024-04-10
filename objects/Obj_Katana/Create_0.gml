event_inherited();

#region Sprites
stand_spr = Spr_Katana_Stand;
forward_spr = Spr_Katana_Forward;
backward_spr = Spr_Katana_Backward;
dash_forward_spr = Spr_Katana_Dash_Forward;
dash_backward_spr = Spr_Katana_Dash_Backward;
crouch_spr = Spr_Katana_Crouch;
ascend_spr = Spr_Katana_Ascend;
descend_spr = Spr_Katana_Descend;
stunned_spr = Spr_Katana_Stunned;
launched_spr = Spr_Katana_Launched;
land_spr = Spr_Katana_Land;
block_spr = Spr_Katana_Block;
crouch_block_spr = Spr_Katana_Crouch_Block;
#endregion

#region Stats
start_speed = 3.5;
max_speed = 5;
acceleration = 0.2;
grip = global.standard_grip;
air_control = 0.2;
dash_speed = 10;
dash_blink = 8;
dash_duration = 24;
dash_grip = 0.75;
jump_power = 10;
mini_jump_power = 0.6; // % based
extra_jump_strength = 0.8; // % based
extra_jumps = 1;
extra_jumps_left = extra_jumps;
weight = global.light_weight;
max_fall_speed = 14;
character_width = 24;
character_height = global.standard_height;
// Original stats
original_grip = grip;
original_weight = weight;
#endregion

action_trigger = function(){
	// Normal moves
	if(action == "8F"){
		attack = instance_create_depth(x, y, 0, Obj_Katana_8F_hitbox);
		attack.initiate(self);
		
		v_velocity -= 3;
		
		sprite_index = Spr_Katana_8F_recovery;
		image_index = 0;
		recover_alarm = generate_sprite_frames(sprite_index);
	}
	else if(action == "2F"){
		attack = instance_create_depth(x, y, 0, Obj_Katana_2F_hitbox);
		attack.initiate(self);
		
		sprite_index = Spr_Katana_2F_recovery;
		image_index = 0;
		recover_alarm = generate_sprite_frames(sprite_index);
	}
	else if(action == "5F"){
		attack = instance_create_depth(x, y, 0, Obj_Katana_5F_hitbox);
		attack.initiate(self);
		
		sprite_index = Spr_Katana_5F_recovery;
		image_index = 0;
		recover_alarm = generate_sprite_frames(sprite_index);
	}
	else if(action == "8L"){
		attack = instance_create_depth(x, y, 0, Obj_Katana_8L_hitbox);
		attack.initiate(self);
		
		h_velocity += 3*image_xscale;
		
		sprite_index = Spr_Katana_8L_recovery;
		image_index = 0;
		recover_alarm = generate_sprite_frames(sprite_index);
	}
	else if(action == "2L"){
		attack = instance_create_depth(x, y, 0, Obj_Katana_2L_hitbox);
		attack.initiate(self);
		
		sprite_index = Spr_Katana_2L_recovery;
		image_index = 0;
		recover_alarm = generate_sprite_frames(sprite_index);
	}
	else if(action == "5L"){
		attack = instance_create_depth(x, y, 0, Obj_Katana_5L_hitbox);
		attack.initiate(self);
		
		grip = original_grip;
		
		sprite_index = Spr_Katana_5L_recovery;
		image_index = 0;
		recover_alarm = generate_sprite_frames(sprite_index);
	}
	else if(action == "8S"){
		attack = instance_create_depth(x, y, 0, Obj_Katana_8S_hitbox);
		attack.initiate(self);
		
		sprite_index = Spr_Katana_8S_recovery;
		image_index = 0;
		recover_alarm = generate_sprite_frames(sprite_index);
	}
	else if(action == "2S"){
		attack = instance_create_depth(x, y, 0, Obj_Katana_2S_hitbox);
		attack.initiate(self);
		
		v_velocity = -jump_power;
		
		sprite_index = Spr_Katana_2S_recovery;
		image_index = 0;
		recover_alarm = generate_sprite_frames(sprite_index);
	}
	else if(action == "5S"){
		attack = instance_create_depth(x, y, 0, Obj_Katana_5S_hitbox);
		attack.initiate(self);
		
		h_velocity = -8*image_xscale;
		
		sprite_index = Spr_Katana_5S_recovery;
		image_index = 0;
		recover_alarm = generate_sprite_frames(sprite_index);
	}
	// Special moves
	else if(action == "High"){
		attack = instance_create_depth(x, y, 0, Obj_Katana_High_hitbox);
		attack.initiate(self);
		
		h_velocity = 6*image_xscale;
		
		sprite_index = Spr_Katana_High_recovery;
		image_index = 0;
		recover_alarm = generate_sprite_frames(sprite_index);
	}
	else if(action == "Sweep"){
		attack = instance_create_depth(x, y, 0, Obj_Katana_Sweep_hitbox);
		attack.initiate(self);
		
		h_velocity = 9*image_xscale;
		grip = original_grip;
		
		sprite_index = Spr_Katana_Sweep_recovery;
		image_index = 0;
		recover_alarm = generate_sprite_frames(sprite_index);
	}
	else if(action == "Send Clone"){
		v_velocity = 0;
		h_velocity = 0;
		can_cancel = true;
		
		clone = instance_create_depth(x, y, 0, Obj_Katana_Clone);
		clone.HP = HP;
		clone.meter = meter;
		clone.index = index;
		clone.hearts = hearts;
		clone.player_color = player_color;
		clone.image_xscale = image_xscale;
		clone.lb_pressed = buffer_duration; // Clone dash
		
		recover_alarm = dash_duration;
	}
	else if(action == "Leave Clone"){ // Do a dash...
		sprite_index = dash_forward_spr;
		h_velocity = dash_speed*image_xscale;
		x += dash_blink*image_xscale;
		meter += 2;
		
		clone = instance_create_depth(x, y, 0, Obj_Katana_Clone);
		clone.HP = HP;
		clone.meter = meter;
		clone.index = index;
		clone.hearts = hearts;
		clone.player_color = player_color;
		clone.image_xscale = image_xscale;
		
		if(!grounded){	
			cancels -= 1;
			// Cancel eff
			eff = instance_create_depth(x, y, 1, Eff_Cancel);
			eff.initiate(self);
		}
	
		action = "dash";
		can_cancel = true;
		is_collidable = false;
		grip = dash_grip;
		extra_grip = dash_grip;
		v_velocity = 0;
		weight = original_weight/4;
		recover_alarm = dash_duration;
	}
	else if(action == "Quickdraw Straight"){
		attack = instance_create_depth(x, y, 0, Obj_Katana_Quickdraw_hitbox);
		attack.initiate(self);
		
		sprite_index = Spr_Katana_Quickdraw_recovery;
		image_index = 0;
		recover_alarm = generate_sprite_frames(sprite_index);
	}
	else if(action == "Quickdraw Up"){
		attack = instance_create_depth(x, y, 0, Obj_Katana_Quickdraw_UP_hitbox);
		attack.initiate(self);
		
		sprite_index = Spr_Katana_Quickdraw_recovery;
		image_index = 0;
		recover_alarm = generate_sprite_frames(sprite_index);
	}
	else if(action == "Quickdraw Down"){
		attack = instance_create_depth(x, y, 0, Obj_Katana_Quickdraw_DOWN_hitbox);
		attack.initiate(self);
		
		sprite_index = Spr_Katana_Quickdraw_recovery;
		image_index = 0;
		recover_alarm = generate_sprite_frames(sprite_index);
	}
	// Meter moves
	else if(action == "X"){
			clone = instance_create_depth(x, y, 0, Obj_Katana_Clone);
			clone.HP = HP;
			clone.meter = meter;
			clone.index = index;
			clone.hearts = hearts;
			clone.player_color = player_color;
			clone.image_xscale = image_xscale;
			clone.sprite_index = Spr_Katana_Clone_Quickdraw_startup;
			clone.action = "Quickdraw";
			clone.action_alarm = 90;
			clone.life_span = 0;
			clone.weight = 0;
			clone.shake_amount = 2;
			
			recover_alarm = 1;
	}
	else if(action == "ULTRA"){
		step_distance = 16;
		steps = 0;
		attack_spr_width = sprite_get_width(Spr_Katana_ULTRA_hitbox);
		
		repeat(16){
			destination = step_distance*image_xscale;
			if(!place_meeting(x+destination, y, Parent_Collision)){
				x += destination;
				steps += 1;
			}
		}
		
		attack = instance_create_depth(x, y, 0, Obj_Katana_ULTRA_hitbox);
		// Attack is spawned behind you after dash/teleport
		attack.image_xscale = -step_distance/attack_spr_width*steps;
		attack.initiate(self);
		sprite_index = Spr_Katana_ULTRA_recovery;
		image_index = 0;
		recover_alarm = generate_sprite_frames(sprite_index);
	}
	else{
		action = noone;
	}
}