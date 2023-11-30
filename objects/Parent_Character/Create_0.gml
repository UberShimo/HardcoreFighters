depth = -1;

index = -1;
controller_index = -1;
is_controllable = false;
is_respawning = false;
is_CPU = false;
surrender_count = 0;
player_color = global.p1_color;

#region Initialize input values / buffers
buffer_duration = 10;

forward_hold = false;
backward_hold = false;
down_hold = false;
forward_pressed = 0;
backward_pressed = 0;
down_pressed = 0;
a_pressed = 0;
a_hold = false;
b_pressed = 0;
b_hold = false;
x_pressed = 0;
x_hold = false;
y_pressed = 0;
y_hold = false;
rb_pressed = 0;
rb_hold = false;
lb_pressed = 0;
lt_hold = false;
rt_hold = false;
start_hold = false;
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
// Fixed stats
HP = 100;
max_HP = HP;
meter = 0;
max_meter = 100;
hearts = global.heart_amount;
can_cancel = false;
cancels = 2;
is_blocking = false;
is_unstoppable = false;
is_invincible = false;
is_collidable = true;
// Variating stats
start_speed = 3;
max_speed = 6;
acceleration = 0.1;
dash_speed = 12;
dash_blink = 16;
dash_duration = 24;
dash_grip = 1;
grip = global.standard_grip; // Slippy: 0.3, Standard: 0.5, Steady: 0.7
air_grip = 0;
jump_power = 12;
mini_jump_power = 0.6; // % based
extra_jump_strength = 0.8; // % based
extra_jumps = 1;
extra_jumps_left = extra_jumps;
weight = global.standard_weight; // Light: 0.6, Standard: 0.7, Heavy: 0.8
max_fall_speed = 16;
character_width = 24;
character_height = global.standard_height; // Short: 48, Standard: 64, Tall: 80
// Original stats
original_grip = grip;
original_air_grip = air_grip;
original_weight = weight;
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
respawn_alarm = 0;

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
		
		backward_held = backward_hold;
		backward_hold = gamepad_button_check(controller_index, gp_padl)
		|| gamepad_axis_value(controller_index, gp_axislh) < -0.5;
		
		if(!backward_held && backward_hold){
			backward_pressed = buffer_duration;
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
		
		backward_held = backward_hold;
		backward_hold = gamepad_button_check(controller_index, gp_padr)
		|| gamepad_axis_value(controller_index, gp_axislh) > 0.5;
		
		if(!backward_held && backward_hold){
			backward_pressed = buffer_duration;
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
	
	// Start
	start_hold = gamepad_button_check(controller_index, gp_start);

	// Jump
	if(gamepad_button_check_pressed(controller_index, gp_face1)){
		a_pressed = buffer_duration;
	}
	a_hold = gamepad_button_check(controller_index, gp_face1);
	
	// Action buttons
	if(gamepad_button_check_pressed(controller_index, gp_face2)){
		b_pressed = buffer_duration;
	}
	b_hold = gamepad_button_check(controller_index, gp_face2);
	
	if(gamepad_button_check_pressed(controller_index, gp_face3)){
		x_pressed = buffer_duration;
	}
	x_hold = gamepad_button_check(controller_index, gp_face3);
	
	if(gamepad_button_check_pressed(controller_index, gp_face4)){
		y_pressed = buffer_duration;
	}
	y_hold = gamepad_button_check(controller_index, gp_face4);
	
	if(gamepad_button_check_pressed(controller_index, gp_shoulderr)){
		rb_pressed = buffer_duration;
	}
	rb_hold = gamepad_button_check(controller_index, gp_shoulderr);
	
	if(gamepad_button_check_pressed(controller_index, gp_shoulderl)){
		lb_pressed = buffer_duration;
	}
	
	// Circle movements
	if(down_pressed && !down_hold && forward_pressed){
		down_forward_pressed = buffer_duration;
	}
	if(forward_pressed && !forward_hold && down_pressed){
		forward_down_pressed = buffer_duration;
	}
	if(down_pressed && !down_hold && backward_pressed){
		down_backward_pressed = buffer_duration;
	}
	if(backward_pressed && !backward_hold && down_pressed){
		backward_down_pressed = buffer_duration;
	}
	if(backward_down_pressed && !down_hold && forward_pressed){
		half_circle_forward_pressed = buffer_duration;
	}
	if(forward_down_pressed && !down_hold && backward_pressed){
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
	if(lt_hold || rt_hold){
		return false;
	}
	
	if(can_cancel && cancels > 0 && recover_alarm < cancelable_recovery_frames){
		return true;
	}
	return false;
}

blink_h = function(x_val){
	if(!place_meeting(x+x_val, y, Parent_Collision)){
		x += x_val;
	}
	// Snap to wall
	else{
		x_check = 1;
		if(x_val < 0){
			x_check = -x_check;
		}
		repeat(x_val){
			if(!place_meeting(x+x_check, y, Parent_Collision)){
				x += x_check;
			}
		}
	}
}