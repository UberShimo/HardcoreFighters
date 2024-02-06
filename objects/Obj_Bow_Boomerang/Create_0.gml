event_inherited();

startup = generate_sprite_frames(Spr_Bow_Boomerang_Throw_startup);
recovery = generate_sprite_frames(Spr_Bow_Boomerang_Throw_recovery);

is_projectile = true;
is_active = false;
is_final = true;

hitbox_frequency = 4;
hitbox_alarm = hitbox_frequency;
return_acceleration = 0.1;
can_be_cought = false;
can_be_cought_alarm = 30;

collide = function(){
	// Bounce
	if(position_meeting(x+h_velocity, y, Parent_Collision)){
		h_velocity *= -0.8;
		x += h_velocity;
	}
	if(position_meeting(x, y+v_velocity, Parent_Collision)){
		v_velocity *= -0.8;
		y += v_velocity;
	}
}