event_inherited();

if(is_active){
	// Effect
	eff = instance_create_depth(x, y, depth, Eff_Baseball);
	eff.image_blend = image_blend;
	eff.image_xscale = image_xscale;
	eff.image_yscale = image_yscale;
	eff.image_angle = image_angle;
}

lifespan -= logic_time;

if(lifespan <= 0){
	instance_destroy();
}
