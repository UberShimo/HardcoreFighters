
if(!global.chaos_mode){
	p1_ui_hp = 0;
	p1_ui_meter = 0;
	p1_ui_hearts = 0;
	if(instance_exists(players[0])){
		p1_ui_hp = players[0].HP/100;
		p1_ui_meter = players[0].meter/100;
		p1_ui_hearts = players[0].hearts;
	}
	
	x_line = 32*ui_pixel_size;
	// HP frame
	draw_sprite_ext(Spr_HP_Bar, 0, x_line, 2, ui_pixel_size, ui_pixel_size, 0, c_white, 1);
	draw_sprite_ext(Spr_HP_Bar, 1, x_line, 2, ui_pixel_size*p1_ui_hp, ui_pixel_size, 0, c_white, 1);
	// Meter frame
	draw_sprite_ext(Spr_Meter_Bar, 0, x_line, 34, ui_pixel_size, ui_pixel_size, 0, c_white, 1);
	draw_sprite_ext(Spr_Meter_Bar, 1, x_line, 34, ui_pixel_size*p1_ui_meter, ui_pixel_size, 0, c_white, 1);
	// Hearts
	for(i = 0; i < p1_ui_hearts; i++){
		draw_sprite_ext(Spr_Heart, 0, x_line-16*ui_pixel_size+32*i*ui_pixel_size, 66, ui_pixel_size, ui_pixel_size, 0, c_white, 1);
	}
	
	p2_ui_hp = 0;
	p2_ui_meter = 0;
	p2_ui_hearts = 0;
	if(instance_exists(players[1])){
		p2_ui_hp = players[1].HP/100;
		p2_ui_meter = players[1].meter/100;
		p2_ui_hearts = players[1].hearts;
	}
	
	x_line = display_get_gui_width()-32*ui_pixel_size;
	// HP frame
	draw_sprite_ext(Spr_HP_Bar, 0, x_line-2, 2, -ui_pixel_size, ui_pixel_size, 0, c_white, 1);
	draw_sprite_ext(Spr_HP_Bar, 1, x_line-2, 2, -ui_pixel_size*p2_ui_hp, ui_pixel_size, 0, c_white, 1);
	// Meter frame
	draw_sprite_ext(Spr_Meter_Bar, 0, x_line, 34, -ui_pixel_size, ui_pixel_size, 0, c_white, 1);
	draw_sprite_ext(Spr_Meter_Bar, 1, x_line, 34, -ui_pixel_size*p2_ui_meter, ui_pixel_size, 0, c_white, 1);
	// Hearts
	for(i = 0; i < p2_ui_hearts; i++){
		draw_sprite_ext(Spr_Heart, 0, x_line+16*ui_pixel_size-32*i*ui_pixel_size, 66, ui_pixel_size, ui_pixel_size, 0, c_white, 1);
	}
}