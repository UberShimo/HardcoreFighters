event_inherited();

startup = generate_sprite_frames(Spr_Bow_Boomerang_Throw_startup);
recovery = generate_sprite_frames(Spr_Bow_Boomerang_Throw_recovery);

damage = 6;
hit_stun = 16;
block_stun = 2;
hit_push = 0;
block_push = 0;
freeze_duration = 16;
h_launch = 0;
v_launch = 0;

is_projectile = true;
is_final = true;
collision_check_with_distance = false;

velocity_friction = 0.2;

is_returning = false;
return_alarm = 120;
return_acceleration = 0.5;
can_be_cought = false;
can_be_cought_alarm = 30;

collide = function(){
	// Bounce
	if(position_meeting(x+h_velocity, y, Parent_Collision)){
		h_velocity *= -0.8;
		x -= h_velocity;
	}
	if(position_meeting(x, y+v_velocity, Parent_Collision)){
		v_velocity *= -0.8;
		y -= v_velocity;
	}
}