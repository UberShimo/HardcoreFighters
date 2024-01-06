event_inherited();

is_active = false;
is_projectile = true;
weight = 0.5;
original_weight = weight;

// Ball things
existing_hitbox = noone;
is_returning = false;
armageddon_is_coming = false;

collide = function(){
	h_velocity = 0;
	v_velocity = 0;

	if(armageddon_is_coming){
		armageddon_is_coming = false;
	
		hitbox = instance_create_depth(x, y, 0, Obj_Baller_ULTRA_hitbox);
		hitbox.initiate(spawner); // Spawner created this hitbox ok?
	}
	else if(existing_hitbox != noone && v_velocity > 6){
		instance_create_depth(x, y, depth, Eff_Ball_Land);
	}
}