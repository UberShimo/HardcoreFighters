event_inherited();

if(is_active){
	// Calculate velocity
	velocity = sqrt(power(h_velocity, 2)+power(v_velocity, 2));
	
	if(velocity > 4){
		image_xscale = velocity/8;
		image_angle = point_direction(0, 0, h_velocity, v_velocity);
	}
	else{
		image_xscale = 0.5;
	}
	// Effect
	eff = instance_create_depth(x, y, depth, Eff_Baseball);
	eff.image_blend = image_blend;
	eff.image_xscale = image_xscale;
	eff.image_yscale = image_yscale;
	eff.image_angle = image_angle;
	
	hit_push = h_velocity;
	block_push = h_velocity;
	h_launch = h_velocity;
	v_launch = v_velocity;
}

h_velocity += h_spin;