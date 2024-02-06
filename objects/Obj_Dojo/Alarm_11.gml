event_inherited();

if(is_doing_F_loop){
	y_pressed = 0;
	b_pressed = 0;
	x_pressed = buffer_duration;
}
else if(is_jumping){
	y_pressed = 0;
	b_pressed = 0;
	x_pressed = 0;
	a_pressed = buffer_duration;
}
else{
	x_pressed = false;
	rng = irandom_range(1, 4);

	if(rng == 3){
		y_pressed = buffer_duration;
	}
	else if(rng == 4){
		b_pressed = buffer_duration;
	}
	else{
		forward_hold = true;
	}
}
