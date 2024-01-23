draw_self();

if(spawner != noone){
	draw_set_alpha(0.1);
	draw_circle_color(spawner.x, spawner.y, distance_range*1.2, c_red, c_red, 4);
	draw_set_alpha(1);
}