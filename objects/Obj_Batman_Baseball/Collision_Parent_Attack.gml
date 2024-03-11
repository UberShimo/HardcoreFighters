if(!other.is_projectile && other.hit_stun > 0 && ds_list_find_index(hitbox_list, other) == -1){
	index = other.index;
	
	h_velocity = other.h_launch*2*other.image_xscale;
	v_velocity = other.v_launch*2;
	
	// little cheating for 5S tip
	if(other.object_index == Obj_Batman_5S_tip_hitbox){
		v_velocity *= 0.5;
	}
	
	damage = other.damage;
	hit_stun = other.hit_stun;
	block_stun = other.block_stun;
	
	is_active = true;
	weight = 0.5;
	h_spin = 0;
	
	other.spawner.can_cancel = true;
	
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
	
	// Spawn effect / sound
	effect_to_spawn = Eff_Splash;
	audio_play_sound(other.hit_sound, 0, false);
	spawn_effect(x, y, 8, effect_to_spawn, 1, 0.05, other.hit_effect_scale);
	
	// Ring
	eff = instance_create_depth(x, y, -1, Eff_Ring);
	eff.grow *= other.hit_effect_scale;
	eff.thickness *= other.hit_effect_scale;
	
	ds_list_add(hitbox_list, other);
}