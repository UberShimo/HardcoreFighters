// Looks if value exists in list. If not it returns -1
if(other.index != index && ds_list_find_index(hitbox_list, other) == -1){
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
	
	if(hit){
		HP -= other.damage;
		action = "stunned";
		recover_alarm = other.hit_stun;
		action_alarm = 0;
		h_velocity = other.hit_push*other.image_xscale;
	
		sprite_index = stunned_spr;
		
		meter += other.meter_gain;
		other.spawner.meter += other.meter_gain;
	
		// Launch
		if(other.is_launcher || !grounded){
			action = "launched";
			v_velocity = other.v_launch;
			h_velocity = other.h_launch*other.image_xscale;
			sprite_index = launched_spr;
		}
	}
	// Blocked
	else{
		action = "stunned";
		recover_alarm = other.block_stun;
		action_alarm = 0;
		h_velocity = other.block_push*other.image_xscale;
		
		other.spawner.meter += other.meter_gain;
	}
	
	// Freeze time
	if(other.freeze_duration > 0){
		object_time = other.freeze_amount;
		time_reset_alarm = other.freeze_duration;
		other.object_time = other.freeze_amount;
		other.time_reset_alarm = other.freeze_duration;
		if(!other.is_projectile){
			other.spawner.object_time = other.freeze_amount;
			other.spawner.time_reset_alarm = other.freeze_duration;
		}
	}
	
	#region spawn effect
	x_pos = x+(character_width/2);
	if(x > other.x){
		x_pos = x-(character_width/2);
	}
	y_other_diff = other.y - y;
	y_pos = y+other.hit_effect_y+y_other_diff;
	if(hit){
		repeat(8){
			eff = instance_create_depth(x_pos, y_pos, -1, Eff_Splash);
			eff.fade = 0.05;
			eff.image_xscale *= other.hit_effect_scale;
			eff.image_yscale *= other.hit_effect_scale;
		}
	}
	eff = instance_create_depth(x_pos, y_pos, -1, Eff_Ring);
	eff.grow *= other.hit_effect_scale;
	eff.thickness *= other.hit_effect_scale;
	#endregion
	
	ds_list_add(hitbox_list, other);
}