function spawn_effect(x_val, y_val, amount, effect, alpha = 1, fade = 0, scale = 1){
	repeat(amount){
		eff = instance_create_depth(x_val, y_val, -1, effect);
		eff.image_alpha = alpha;
		eff.fade = fade;
		eff.image_xscale *= scale;
		eff.image_yscale *= scale;
	}
}