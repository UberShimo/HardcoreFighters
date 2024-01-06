event_inherited();

startup = generate_sprite_frames(Spr_Batman_Sweep_startup); // 100% informational not used in logic
recovery = generate_sprite_frames(Spr_Batman_Sweep_recovery); // 100% informational not used in logic

is_projectile = true;
is_active = false;

max_speed = 32;
max_duration = 480;
acceleration = 8;
break_power = 2;
v_speed = 2;
target = noone;
turns = 0;
existing_hitbox = noone;

collide = function(){
	if(target == noone){
		instance_destroy();
	}
}