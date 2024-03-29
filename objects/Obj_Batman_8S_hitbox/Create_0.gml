event_inherited();

startup = generate_sprite_frames(Spr_Batman_8S_startup); // 100% informational not used in logic
recovery = generate_sprite_frames(Spr_Batman_8S_recovery); // 100% informational not used in logic

damage = 8;
hit_stun = 20;
block_stun = 20;
hit_push = 2;
block_push = 2;
freeze_duration = 20;
h_launch = 3;
v_launch = 10;

is_high = true;
is_sticky = true;

hit_sound = Snd_Hit2;
block_sound = Snd_Heavy_Block;