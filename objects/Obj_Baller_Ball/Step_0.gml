event_inherited();

velocity = point_distance(0, 0, h_velocity, v_velocity);

if(is_returning){
	spd = 12;
	dir = point_direction(x, y, spawner.x, spawner.y);
	h_velocity = lengthdir_x(spd, dir);
	v_velocity = lengthdir_y(spd, dir);
}

// Hurting ball
if(velocity > 7){
	// Spawn da hitbox
	if(existing_hitbox == noone){
		existing_hitbox = instance_create_depth(x, y, depth, Obj_Baller_Ball_hitbox);
		existing_hitbox.ball = self;
		existing_hitbox.initiate(spawner); // Its not this ball that initiate the hitbox ok?
	}
	// Make proper stats
	existing_hitbox.hit_push = abs(h_velocity/2);
	existing_hitbox.block_push = abs(h_velocity/3);
	existing_hitbox.h_launch = abs(h_velocity);
	existing_hitbox.v_launch = v_velocity;
	
	// Turn it right?.. or left?
	if(h_velocity > 4){
		existing_hitbox.image_xscale = 1;
		existing_hitbox.is_side_irrelevant = false;
	}
	else if(h_velocity < -4){
		existing_hitbox.image_xscale = -1;
		existing_hitbox.is_side_irrelevant = false;
	}
	else{
		existing_hitbox.is_side_irrelevant = true;
	}
	// Make it high?
	if(v_velocity > abs(h_velocity)){
		existing_hitbox.is_high = true;
	}
	// Make it launcher?
	else if(v_velocity < -6){
		existing_hitbox.is_launcher = true;
	}
	// Create effect
	instance_create_depth(x, y, depth, Eff_Baller_Ball);
}
// Harmless ball
else{
	if(existing_hitbox != noone){
		instance_destroy(existing_hitbox);
		existing_hitbox = noone;
	}
}