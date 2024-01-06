event_inherited();

penetration = 0.25;
is_projectile = true;
is_cancelable = true;
weight = 0.4;
collision_check_distance = 16;

is_active = false;
h_spin = 0;

image_blend = c_red;
image_xscale = 0.5;
image_yscale = 0.5;

hitbox_list = ds_list_create();

collide = function(){
	instance_destroy();
}