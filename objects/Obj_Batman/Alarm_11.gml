event_inherited();

// Special moves
rng = irandom_range(1, 10);

if(rng == 1){
	half_circle_forward_pressed = buffer_duration;
	b_pressed = buffer_duration;
}
else if(rng == 2){
	half_circle_backward_pressed = buffer_duration;
	b_pressed = buffer_duration;
}
else if(rng == 3){
	half_circle_forward_pressed = buffer_duration;
	rb_pressed = buffer_duration;
}
else if(rng == 4){
	down_forward_pressed = buffer_duration;
	x_pressed = buffer_duration;
}
else if(rng == 5){
	forward_down_pressed = buffer_duration;
	x_pressed = buffer_duration;
}
else if(rng == 6){
	down_forward_pressed = buffer_duration;
	b_pressed = buffer_duration;
}