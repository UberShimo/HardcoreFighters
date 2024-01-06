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
		meter += other.meter_gain;
		other.spawner.meter += other.meter_gain;
		
		// Also all first code is calculated in vain if you get launched...
		// Dont flinch against normal attacks if you are priority struck
		if(!is_unstoppable && other.hit_stun > 0 && (!priority_struck || other.is_priority)){
			if(other.is_priority){
				priority_struck = true;
				alarm[9] = other.freeze_duration;
			}
			
			action = "stunned";
			action_alarm = 0;
			recover_alarm = other.hit_stun;
			
			// Grounded push
			if(other.h_affecting){
				// Projectile
				if(other.is_projectile && other.h_velocity != 0){
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
			}
	
			sprite_index = stunned_spr;
	
			// Launch
			if(other.is_launcher || !grounded){
				action = "launched";
				// Shockwave
				if(other.is_shockwave){
					dir = point_direction(other.x, other.y, x, y);
					h_velocity = lengthdir_x(other.shockwave_power, dir);
					v_velocity = lengthdir_y(other.shockwave_power, dir);
				}
				// Normal attack
				else{
					if(other.v_affecting){
						v_velocity = other.v_launch;
					}
					if(other.h_affecting){
						h_velocity = other.h_launch*other.image_xscale;
					}
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
	if(!hit){
		effect_to_spawn = Eff_Spark;
	}
	spawn_effect(x_pos, y_pos, 8, effect_to_spawn, 1, 0.05, other.hit_effect_scale);
	
	// Ring
	eff = instance_create_depth(x_pos, y_pos, -1, Eff_Ring);
	eff.grow *= other.hit_effect_scale;
	eff.thickness *= other.hit_effect_scale;
	#endregion
	
	audio_play_sound(other.hit_sound, 0, false);
	ds_list_add(hitbox_list, other);
	
	// Just so HP bar wont freak out
	if(HP <= 0){
		HP = 0;
		
		shake_amount = 8;
		object_time = 0;
		time_reset_alarm = 30;
		death_alarm = 30;
	}
}