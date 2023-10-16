depth = -1;

index = -1;
controller_index = -1;
is_controllable = true;
is_CPU = false;
debugging = false;
debug_focus = "";

#region Initialize input values / buffers
buffer_duration = 8;

forward_hold = false;
backward_hold = false;
down_hold = false;
forward_pressed = 0;
backward_pressed = 0;
down_pressed = 0;
a_pressed = 0;
a_hold = false;
b_pressed = 0;
x_pressed = 0;
y_pressed = 0;
grab_pressed = 0;
lb_pressed = 0;
rb_pressed = 0;
lt_hold = 0;
rt_hold = 0;
down_forward_pressed = 0;
forward_down_pressed = 0;
half_circle_forward_pressed = 0;
down_backward_pressed = 0;
backward_down_pressed = 0;
half_circle_backward_pressed = 0;
#endregion

#region Sprites
stand_spr = noone;
forward_spr = noone;
backward_spr = noone;
dash_forward_spr = noone;
dash_backward_spr = noone;
crouch_spr = noone;
ascend_spr = noone;
descend_spr = noone;
stunned_spr = noone;
launched_spr = noone;
land_spr = noone;
block_spr = noone;
crouch_block_spr = noone;
#endregion

#region Stats
HP = 100;
max_HP = HP;
meter = 0;
max_meter = 100;
start_speed = 3;
max_speed = 6;
acceleration = 0.1;
dash_speed = 16;
dash_duration = 24;
dash_grip = 1.5;
grip = 0.5;
original_grip = grip;
air_grip = 0;
original_air_grip = air_grip;
can_cancel = false;
cancels = 2;
jump_power = 12;
mini_jump_power = 0.6; // % based
extra_jump_strength = 0.8; // % based
extra_jumps = 1;
extra_jumps_left = extra_jumps;
weight = 0.7;
original_weight = weight;
max_fall_speed = 16;
is_blocking = false;
is_unstoppable = false;
is_invincible = false;
is_collidable = true;
character_width = 24;
character_height = 64;
#endregion

#region Physics values
h_velocity = 0;
v_velocity = 0;
grounded = true;
object_time = 1; // % based
logic_time = 1; // % based
shake_amount = 0;
#endregion

// Stuff
action = noone;
last_action = noone; // Used for checking if cancel is legit
hitbox_list = ds_list_create();
cancelable_recovery_frames = 24;
closest_enemy = self;
multi_hit_action_index = 0;

// Alarms
action_alarm = 0;
recover_alarm = 0;
time_reset_alarm = 0;

// Methods
action_trigger = function(){
	// Activated by action_alarm.
	// This alarm performs the queued action. Like spawning hitboxes and shit...
}

reset_buffers = function(){
	forward_pressed = 0;
	down_pressed = 0;
	backward_pressed = 0;
	a_pressed = 0;
	b_pressed = 0;
	x_pressed = 0;
	y_pressed = 0;
	lb_pressed = 0;
	rb_pressed = 0;
	down_forward_pressed = 0;
	forward_down_pressed = 0;
	half_circle_forward_pressed = 0;
	down_backward_pressed = 0;
	backward_down_pressed = 0;
	half_circle_backward_pressed = 0;
}

face_closest_enemy = function(){
	temp_x = x;
	x = -room_width;
	closest_enemy = instance_nearest(temp_x, y, Parent_Character);
	x = temp_x;
		
	if(x < closest_enemy.x){
		image_xscale = 1;
	}
	else{
		image_xscale = -1;
	}
}

read_input = function(){
	// Facing right
	if(image_xscale > 0){
		forward_held = forward_hold;
		forward_hold = gamepad_button_check(controller_index, gp_padr)
		|| gamepad_axis_value(controller_index, gp_axislh) > 0.5;
		
		if(!forward_held && forward_hold){
			forward_pressed = buffer_duration;
		}
		
		// Make sure you cant hold forward and backward at the same time
		if(!forward_hold){
			backward_held = backward_hold;
			backward_hold = gamepad_button_check(controller_index, gp_padl)
			|| gamepad_axis_value(controller_index, gp_axislh) < -0.5;
		
			if(!backward_held && backward_hold){
				backward_pressed = buffer_duration;
			}
		}
	}
	// Facing left
	else{
		forward_held = forward_hold;
		forward_hold = gamepad_button_check(controller_index, gp_padl)
		|| gamepad_axis_value(controller_index, gp_axislh) < -0.5;
		
		if(!forward_held && forward_hold){
			forward_pressed = buffer_duration;
		}
		
		// Make sure you cant hold forward and backward at the same time
		if(!forward_hold){
			backward_held = backward_hold;
			backward_hold = gamepad_button_check(controller_index, gp_padr)
			|| gamepad_axis_value(controller_index, gp_axislh) > 0.5;
		
			if(!backward_held && backward_hold){
				backward_pressed = buffer_duration;
			}
		}
	}
	// Down
	down_held = down_hold;
	down_hold = gamepad_button_check(controller_index, gp_padd)
	|| gamepad_axis_value(controller_index, gp_axislv) > 0.5;
		
	if(!down_held && down_hold){
		down_pressed = buffer_duration;
	}
	
	// Block hold
	rt_hold = gamepad_button_check(controller_index, gp_shoulderrb) && !lt_hold;
	lt_hold = gamepad_button_check(controller_index, gp_shoulderlb) && !rt_hold;

	// Jump
	if(gamepad_button_check_pressed(controller_index, gp_face1)){
		a_pressed = buffer_duration;
	}
	a_hold = gamepad_button_check(controller_index, gp_face1);
	
	// Action buttons
	if(gamepad_button_check_pressed(controller_index, gp_face2)){
		b_pressed = buffer_duration;
	}
	if(gamepad_button_check_pressed(controller_index, gp_face3)){
		x_pressed = buffer_duration;
	}
	if(gamepad_button_check_pressed(controller_index, gp_face4)){
		y_pressed = buffer_duration;
	}
	if(gamepad_button_check_pressed(controller_index, gp_shoulderl)){
		lb_pressed = buffer_duration;
	}
	if(gamepad_button_check_pressed(controller_index, gp_shoulderr)){
		rb_pressed = buffer_duration;
	}
	
	// Circle movements
	if(down_pressed && !down_hold && forward_pressed){
		down_forward_pressed = buffer_duration;
	}
	else if(forward_pressed && !forward_hold && down_pressed){
		forward_down_pressed = buffer_duration;
	}
	else if(backward_down_pressed && !down_hold && forward_pressed){
		half_circle_forward_pressed = buffer_duration;
	}
	else if(down_pressed && !down_hold && backward_pressed){
		down_backward_pressed = buffer_duration;
	}
	else if(backward_pressed && !backward_hold && down_pressed){
		backward_down_pressed = buffer_duration;
	}
	else if(forward_down_pressed && !down_hold && backward_pressed){
		half_circle_backward_pressed = buffer_duration;
	}
}
	
reset_physics = function(){
	grip = original_grip;
	air_grip = original_air_grip;
	weight = original_weight;
	multi_hit_action_index = 0;
	is_collidable = true;
}

action_button_pressed = function(){
	if(x_pressed || y_pressed || b_pressed || lb_pressed || rb_pressed){
		return true;
	}
	return false;
}

check_for_cancel = function(){
	if(can_cancel && cancels > 0 && recover_alarm < cancelable_recovery_frames){
		return true;
	}
	return false;
}