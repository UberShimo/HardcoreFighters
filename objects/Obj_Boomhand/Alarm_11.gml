event_inherited();

if(is_controllable){
	// Special moves
	rng = irandom_range(1, 10);

	rb_hold = false;
	if(meter >= 10 && irandom_range(1, 4) == 1){
		rb_hold = true;
		if(meter >= 100){
			half_circle_forward_pressed = true;
		}
	}
	else if(rng == 1){
		half_circle_forward_pressed = buffer_duration;
		b_pressed = buffer_duration;
	}
	else if(rng == 2){
		half_circle_backward_pressed = buffer_duration;
		b_pressed = buffer_duration;
	}
	else if(rng == 3){
		half_circle_forward_pressed = buffer_duration;
		x_pressed = buffer_duration;
	}
	else if(rng == 4){
		forward_down_pressed = buffer_duration;
		x_pressed = buffer_duration;
	}
	else if(rng == 5){
		down_forward_pressed = buffer_duration;
		y_pressed = buffer_duration;
	}
	else if(rng == 6){
		down_backward_pressed = buffer_duration;
		y_pressed = buffer_duration;
	}
}