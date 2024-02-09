x_draw = x+random_range(-shake_amount, shake_amount);
y_draw = y+random_range(-shake_amount, shake_amount);

// Draw self
draw_sprite_ext(sprite_index, image_index, x_draw, y_draw, image_xscale, image_yscale, image_angle, c_white, image_alpha);
// Draw player number
c = player_color;
draw_text_transformed_color(x-8, y-character_height-32, string(index+1), 2, 2, 0, c, c, c, c, image_alpha);

// Invincible
if(is_invincible){
	scale = character_height/48;
	draw_sprite_ext(Spr_Circle, 0, x, y, scale, scale, 0, c_white, 0.5);
}

if(draw_mini_ui){
	hp_bar_x = x-sprite_get_width(Spr_Mini_HP_Bar)/2;
	meter_bar_x = x-sprite_get_width(Spr_Mini_Meter_Bar)/2;
	
	// HP bar
	draw_sprite_ext(Spr_Mini_HP_Bar, 1, hp_bar_x, y-character_height+16, HP/max_HP, 1, 0, c_white, 1);
	draw_sprite_ext(Spr_Mini_HP_Bar, 0, hp_bar_x, y-character_height+16, 1, 1, 0, c_white, 1);
	// Meter bar
	draw_sprite_ext(Spr_Mini_Meter_Bar, 1, meter_bar_x, y-character_height+24, meter/max_meter, 1, 0, c_white, 1);
	draw_sprite_ext(Spr_Mini_Meter_Bar, 0, meter_bar_x, y-character_height+24, 1, 1, 0, c_white, 1);
	// Hearts
	for(i = 0; i < hearts; i++){
		draw_sprite_ext(Spr_Heart, 0, x-32+16*i, y-character_height+10, 0.3, 0.3, 0, c_white, 1);
	}
}

// Draw EXITING...
if(exit_count > 0){
	a = exit_count/exit_count_goal;
	draw_text_color(x-32, y-character_height, "EXITING...", c, c, c, c, a);
}

if(global.is_debugging){
	draw_text(x, y-character_height-128, string(alarm[11]));
	draw_text(x, y-character_height-112, "HP:  " + string(HP));
	draw_text(x, y-character_height-96, "Meter:  " + string(meter));
	draw_text(x, y-character_height-80, "h_vel:  " + string(h_velocity));
	draw_text(x, y-character_height-64, "v_vel:  " + string(v_velocity));
	draw_text(x, y-character_height-48, "cancels:  " + string(cancels));
	draw_text(x, y-character_height-32, "startup:  " + string(action_alarm));
	draw_text(x, y-character_height-16, "recovery:  " + string(recover_alarm));
	draw_text(x, y-character_height, "action:  " + string(action));
	
	draw_set_color(c_lime);
	draw_set_alpha(0.2);
	draw_rectangle(bbox_left, bbox_top, bbox_right, bbox_bottom, false);
	draw_set_color(c_white);
	draw_set_alpha(1);
}