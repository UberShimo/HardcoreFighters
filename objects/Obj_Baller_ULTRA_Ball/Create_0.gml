event_inherited();

damage = 20;
hit_stun = 24;
block_stun = 16;
hit_push = 0;
block_push = 0;
freeze_duration = 8;
h_launch = 0;
v_launch = 4;

is_projectile = true;
is_side_irrelevant = true;
is_high = true;

h_velocity = random_range(-4, 4);
weight = 0.1;
v_velocity = 4;

image_xscale = 2;
image_yscale = 2;

collide = function(){
	instance_create_depth(x, y, 1, Eff_Ball_Land);
	instance_destroy();
}