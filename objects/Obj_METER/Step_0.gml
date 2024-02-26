event_inherited();

// Charge effect
if(effect_counter >= 1){
	eff = instance_create_depth(x+eff_x, y+eff_y, 1, Eff_Spark);
	eff.image_blend = c_lime;
	eff.image_xscale *= random_range(1, 2);
}