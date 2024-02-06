draw_self();

draw_text_color(x+3, y-3, string(index+1), c_black, c_black, c_black, c_black, 1);

// Draw EXITING...
if(exit_count > 0){
	a = exit_count/exit_count_goal;
	c = c_white;
	draw_text_color(x+-8, y+16, "EXITING...", c, c, c, c, a);
}