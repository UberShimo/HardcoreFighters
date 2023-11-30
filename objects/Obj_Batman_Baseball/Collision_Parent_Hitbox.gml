if(!other.is_projectile && ds_list_find_index(hitbox_list, other) == -1){
	index = other.index;
	
	h_velocity = other.h_launch*2*other.image_xscale;
	v_velocity = other.v_launch*2;
	
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
	
	// spawn effect
	repeat(8){
		eff = instance_create_depth(x, y, -1, Eff_Splash);
		eff.fade = 0.05;
		eff.image_xscale *= other.hit_effect_scale;
		eff.image_yscale *= other.hit_effect_scale;
	}
	eff = instance_create_depth(x, y, -1, Eff_Ring);
	eff.grow *= other.hit_effect_scale;
	eff.thickness *= other.hit_effect_scale;
	
	ds_list_add(hitbox_list, other);
}