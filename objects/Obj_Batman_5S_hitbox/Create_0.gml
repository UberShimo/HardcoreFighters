event_inherited();

startup = generate_sprite_frames(Spr_Batman_5S_startup); // 100% informational not used in logic
recovery = generate_sprite_frames(Spr_Batman_5S_recovery); // 100% informational not used in logic

damage = 10;
hit_stun = 20;
block_stun = 12;
hit_push = 12;
block_push = 12;
freeze_duration = 12;
h_launch = 5;
v_launch = -3;

is_launcher = true;
hit_effect_y = -8;

hit_sound = Snd_Hit2;
block_sound = Snd_Heavy_Block;