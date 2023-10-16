draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, image_angle, c_white, image_alpha);

if(debugging){
	draw_text(x, y-character_height-112, "HP:  " + string(HP));
	draw_text(x, y-character_height-96, "Meter:  " + string(meter));
	draw_text(x, y-character_height-80, "h_vel:  " + string(h_velocity));
	draw_text(x, y-character_height-64, "v_vel:  " + string(v_velocity));
	draw_text(x, y-character_height-48, "cancels:  " + string(cancels));
	draw_text(x, y-character_height-32, "startup:  " + string(action_alarm));
	draw_text(x, y-character_height-16, "recovery:  " + string(recover_alarm));
	draw_text(x, y-character_height, "action:  " + string(action));
}