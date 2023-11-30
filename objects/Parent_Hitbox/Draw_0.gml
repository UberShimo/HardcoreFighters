if(is_projectile){
	draw_self();
}

if(global.is_debugging){
	draw_self();
	if(is_low){
		draw_sprite_ext(Spr_Arrow, 0, x, y, 1, 1, -90, c_fuchsia, 1);
	}
	if(is_high){
		draw_sprite_ext(Spr_Arrow, 0, x, y, 1, 1, 90, c_fuchsia, 1);
	}
}