event_inherited();

startup = generate_sprite_frames(Spr_Bow_Aim_Up_startup);
recovery = generate_sprite_frames(Spr_Bow_Aim_Up_recovery);

damage = 14;
hit_stun = 16;
block_stun = 8;
hit_push = 5;
block_push = 2;
freeze_duration = 8;
h_launch = 1;
v_launch = -4;

is_projectile = true;
is_cancelable = true;

spd = 0;
hitbox_list = ds_list_create();

collide = function(){
	instance_destroy();
}