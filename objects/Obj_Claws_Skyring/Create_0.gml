event_inherited();

is_active = false;
is_final = true;
is_projectile = true;

weight = 0.025;
h_acceleration = 0.05;
max_speed = 4;

collide = function(){
	instance_destroy();
}