event_inherited();

#region Sprites
stand_spr = Spr_Cultist_Stand;
forward_spr = Spr_Cultist_Forward;
backward_spr = Spr_Cultist_Backward;
dash_forward_spr = Spr_Cultist_Dash_Forward;
dash_backward_spr = Spr_Cultist_Dash_Backward;
crouch_spr = Spr_Cultist_Crouch;
ascend_spr = Spr_Cultist_Ascend;
descend_spr = Spr_Cultist_Descend;
stunned_spr = Spr_Cultist_Stunned;
launched_spr = Spr_Cultist_Launched;
land_spr = Spr_Cultist_Land;
block_spr = Spr_Cultist_Block;
crouch_block_spr = Spr_Cultist_Crouch_Block;
#endregion

#region Stats
start_speed = 3;
max_speed = 5;
acceleration = 0.1;
dash_speed = 0;
dash_blink = 96;
dash_duration = 32;
dash_grip = 1;
grip = global.standard_grip;
air_grip = 0;
jump_power = 13;
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

// Cultist stuff
circle = noone;
triangle = noone;
diamond = instance_create_depth(x, y, depth-1, Obj_Cultist_Diamond);
diamond.spawner = self;
shadow = instance_create_depth(x, y, depth-1, Obj_Cultist_Shadow);
shadow.spawner = self;
is_slowing_down_time = false;
slow_amount = 0.25; // RB slowdown power. % based

action_trigger = function(){
	// Normal moves
	if(action == "F"){
		attack = instance_create_depth(x, y, 0, Obj_Cultist_F_hitbox);
		attack.initiate(self);
		
		sprite_index = Spr_Cultist_F_recovery;
		image_index = 0;
		recover_alarm = generate_sprite_frames(sprite_index);
	}
	else if(action == "2F"){
		attack = instance_create_depth(x, y, 0, Obj_Cultist_2F_hitbox);
		attack.initiate(self);
		
		sprite_index = Spr_Cultist_2F_recovery;
		image_index = 0;
		recover_alarm = generate_sprite_frames(sprite_index);
	}
	else if(action == "L"){
		attack = instance_create_depth(diamond.x, diamond.y, 0, Obj_Cultist_L_hitbox);
		attack.initiate(self);
		
		sprite_index = Spr_Cultist_L_recovery;
		image_index = 0;
		recover_alarm = generate_sprite_frames(sprite_index);
	}
	else if(action == "2L"){
		attack = instance_create_depth(x, y, 0, Obj_Cultist_2L_hitbox);
		attack.initiate(self);
		
		sprite_index = Spr_Cultist_2L_recovery;
		image_index = 0;
		recover_alarm = generate_sprite_frames(sprite_index);
	}
	else if(action == "8S"){
		attack = instance_create_depth(x+32*image_xscale, y, 0, Obj_Cultist_8S_hitbox);
		attack.initiate(self);
		
		h_velocity = 0;
		v_velocity = -6;
		
		sprite_index = Spr_Cultist_8S_recovery;
		image_index = 0;
		recover_alarm = generate_sprite_frames(sprite_index);
	}
	else if(action == "2S"){
		attack = instance_create_depth(x+32*image_xscale, y, 0, Obj_Cultist_2S_hitbox);
		attack.initiate(self);
		
		sprite_index = Spr_Cultist_2S_recovery;
		image_index = 0;
		recover_alarm = generate_sprite_frames(sprite_index);
	}
	else if(action == "5S"){
		attack = instance_create_depth(x, y, 0, Obj_Cultist_5S_hitbox);
		attack.initiate(self);
		
		sprite_index = Spr_Cultist_5S_recovery;
		image_index = 0;
		recover_alarm = generate_sprite_frames(sprite_index);
	}
	// Special moves
	else if(action == "Circle Teleport"){
		x = circle.x;
		y = circle.y;
		instance_destroy(circle);
		circle = noone;
		
		action = noone;
	}
	else if(action == "Circle Pullback"){
		attack = instance_create_depth(circle.x, circle.y, 0, Obj_Cultist_Circle_Pullback_hitbox);
		attack.initiate(self);
		eff = instance_create_depth(circle.x, circle.y, depth-1, Obj_Cultist_Circle_Pullback_hit_eff);
		scale = distance_to_point(circle.x, circle.y)/sprite_get_width(Spr_Cultist_Circle_Pullback_hitbox);
		dir = point_direction(circle.x, circle.y, x, y);
		instance_destroy(circle);
		circle = noone;
		
		attack.image_xscale = scale;
		attack.image_angle = dir;
		eff.image_xscale = scale;
		eff.image_angle = dir;
		
		sprite_index = Spr_Cultist_Circlepull_recovery;
		image_index = 0;
		recover_alarm = generate_sprite_frames(sprite_index);
	}
	else if(action == "Circle Dash Forward"){
		if(circle != noone){
			instance_destroy(circle);
		}
		circle = instance_create_depth(x, y, depth-1, Obj_Cultist_Circle);
		circle.initiate(self);
		
		h_velocity = 10*image_xscale;
		air_grip = 0.5;
		
		sprite_index = Spr_Cultist_Circledash_Forward_recovery;
		image_index = 0;
		recover_alarm = generate_sprite_frames(sprite_index);
	}
	else if(action == "Circle Dash Backward"){
		if(circle != noone){
			instance_destroy(circle);
		}
		circle = instance_create_depth(x, y, depth-1, Obj_Cultist_Circle);
		circle.initiate(self);
		
		h_velocity = -10*image_xscale;
		air_grip = 0.5;
		
		sprite_index = Spr_Cultist_Circledash_Backward_recovery;
		image_index = 0;
		recover_alarm = generate_sprite_frames(sprite_index);
	}
	else if(action == "Straight Star"){
		star = instance_create_depth(x, y, depth-1, Obj_Cultist_Star);
		star.initiate(self);
		star.h_velocity = 2.5*image_xscale;
		
		sprite_index = Spr_Cultist_Starthrow_recovery;
		image_index = 0;
		recover_alarm = generate_sprite_frames(sprite_index);
	}
	else if(action == "Falling Star"){
		star = instance_create_depth(x, y, depth-1, Obj_Cultist_Star);
		star.initiate(self);
		star.h_velocity = 1*image_xscale;
		star.v_velocity = -3;
		star.v_acc = 0.03;
		
		sprite_index = Spr_Cultist_Starthrow_recovery;
		image_index = 0;
		recover_alarm = generate_sprite_frames(sprite_index);
	}
	else if(action == "Rising Star"){
		star = instance_create_depth(x, y, depth-1, Obj_Cultist_Star);
		star.initiate(self);
		star.h_velocity = 1.5*image_xscale;
		star.v_velocity = 0.2;
		star.v_acc = -0.01;
		
		sprite_index = Spr_Cultist_Starthrow_recovery;
		image_index = 0;
		recover_alarm = generate_sprite_frames(sprite_index);
	}
	else if(action == "Plant Mine"){
		instance_create_depth(x+48*image_xscale, y, 0, Obj_Cultist_Mine);
		
		sprite_index = Spr_Cultist_Mine_recovery;
		image_index = 0;
		recover_alarm = generate_sprite_frames(sprite_index);
	}
	else if(action == "Heal"){
		sprite_index = Spr_Cultist_Heal;
		image_index = 0;
		recover_alarm = generate_sprite_frames(sprite_index);
	}
	else if(action == "High"){
		attack = instance_create_depth(x, y, 0, Obj_Cultist_High_hitbox);
		attack.initiate(self);
		
		sprite_index = Spr_Cultist_High_recovery;
		image_index = 0;
		recover_alarm = generate_sprite_frames(sprite_index);
	}
	else if(action == "Sweep"){
		attack = instance_create_depth(x, y, 0, Obj_Cultist_Sweep_hitbox);
		attack.initiate(self);
		
		h_velocity = 8*image_xscale;
		sprite_index = Spr_Cultist_Sweep_recovery;
		image_index = 0;
		recover_alarm = generate_sprite_frames(sprite_index);
	}
	// Meter moves
	else if(action == "ULTRA"){
		action = noone;
	}
	else{
		action = noone;
	}
}