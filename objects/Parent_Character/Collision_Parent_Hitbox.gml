// Looks if value exists in list. If not it returns -1
if(other.index != index && ds_list_find_index(hitbox_list, other) == -1
&& !is_invincible && !is_respawning && other.is_active){
	reset_physics();
	
	#region Check if you got hit
	hit = false;
	
	if(!is_blocking || other.penetration = 1){
		hit = true;
	}
	else if(is_blocking){
		// Crossed up?
		if(!other.is_side_irrelevant){
			// Projectile
			if(other.is_projectile){
				// Attack on right
				if(x < other.x && image_xscale < 0 && other.h_velocity < 0){
					hit = true;
				}
				// Attack on left
				else if(x > other.x && image_xscale > 0 && other.h_velocity > 0){
					hit = true;
				}
			}
			// Shockwave
			else if(other.is_shockwave){
				// Attack on right
				if(x < other.x && image_xscale < 0){
					hit = true;
				}
				// Attack on left
				else if(x > other.x && image_xscale > 0){
					hit = true;
				}
			}
			// Melee
			else{
				// Attack on right
				if(other.image_xscale < 0 && image_xscale < 0){
					hit = true;
				}
				// Attack on left
				else if(other.image_xscale > 0 && image_xscale > 0){
					hit = true;
				}
			}
		}
		if(other.is_low && !down_hold){
			hit = true;
		}
		if(other.is_high && down_hold){
			hit = true;
		}
	}
	#endregion
	
	#region Get smacked
	if(hit){
		HP -= other.damage;
		if(!is_unstoppable && other.hit_stun > 0){
			action = "stunned";
			recover_alarm = other.hit_stun;
			action_alarm = 0;
			
			// Projectile
			if(other.is_projectile && other.h_velocity ){
				if(other.h_velocity > 0){
					h_velocity = other.hit_push;
				}
				else{
					h_velocity = -other.hit_push;
				}
			}
			// Shockwave
			else if(other.is_shockwave){
				if(x > other.x){
					h_velocity = other.hit_push;
				}
				else{
					h_velocity = -other.hit_push;
				}
			}
			// Melee
			else{
				h_velocity = other.hit_push*other.image_xscale;
			}
	
			sprite_index = stunned_spr;
		
			meter += other.meter_gain;
			other.spawner.meter += other.meter_gain;
	
			// Launch
			if(other.is_launcher || !grounded){
				action = "launched";
				// Shockwave
				if(other.is_shockwave){
					dir = point_direction(x, y, other.x, other.y);
					h_velocity = lengthdir_x(other.shockwave_power, dir);
					v_velocity = lengthdir_y(other.shockwave_power, dir);
				}
				// Normal attack
				else{
					v_velocity = other.v_launch;
					h_velocity = other.h_launch*other.image_xscale;
				}
				sprite_index = launched_spr;
			}
		}
	}
	// Blocked
	else if(other.block_stun > 0){
		action = "stunned";
		recover_alarm = other.block_stun;
		action_alarm = 0;
		h_velocity = other.block_push*other.image_xscale;
		
		other.spawner.meter += other.meter_gain;
	}
	#endregion
	
	#region Freeze time
	if(other.freeze_duration > 0){
		if(other.shake_amount > shake_amount){
			shake_amount = other.shake_amount;
		}
		object_time = other.freeze_amount;
		time_reset_alarm = other.freeze_duration;
		other.object_time = other.freeze_amount;
		other.time_reset_alarm = other.freeze_duration;
		if(!other.is_projectile){
			other.spawner.object_time = other.freeze_amount;
			other.spawner.time_reset_alarm = other.freeze_duration;
		}
	}
	#endregion
	
	#region spawn effect
	x_pos = x+(character_width/2);
	if(x > other.x){
		x_pos = x-(character_width/2);
	}
	y_other_diff = other.y - y;
	y_pos = y+other.hit_effect_y+y_other_diff;
	// Decide spawn effect
	effect_to_spawn = Eff_Splash;
	effect_amount = 8;
	if(!hit){
		effect_to_spawn = Eff_Spark;
	}
	// Spawn the effect
	repeat(effect_amount){
		eff = instance_create_depth(x_pos, y_pos, -1, effect_to_spawn);
		eff.fade = 0.05;
		eff.image_xscale *= other.hit_effect_scale;
		eff.image_yscale *= other.hit_effect_scale;
	}
	// Ring
	eff = instance_create_depth(x_pos, y_pos, -1, Eff_Ring);
	eff.grow *= other.hit_effect_scale;
	eff.thickness *= other.hit_effect_scale;
	#endregion
	
	ds_list_add(hitbox_list, other);
	
	#region Die
	if(HP <= 0){
		HP = 0;
		hearts -= 1;
		h_velocity = 0;
		v_velocity = 0;
		// Blood / respawn effect
		repeat(12){
			instance_create_depth(x, y, depth, Eff_Blood);
			eff = instance_create_depth(x_pos, y_pos, -1, effect_to_spawn);
			eff.fade = 0.05;
			eff.image_blend = c_red;
			eff.image_xscale *= 4;
			eff.image_yscale *= 4;
		}
		eff = instance_create_depth(x_pos, y_pos, -1, Eff_Ring);
		eff.grow *= 4;
		eff.image_blend = c_red;
		
		if(hearts > 0){
			respawn_alarm = 120;
			is_invincible = true;
			is_respawning = true;
		}
		
		x = Obj_Respawner.x;
		y = Obj_Respawner.y;
		
		Obj_Match_Manager.check_for_winner();
	}
	#endregion
}