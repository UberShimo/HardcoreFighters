event_inherited();

startup = generate_sprite_frames(Spr_Katana_8S_startup); // 100% informational not used in logic
recovery = generate_sprite_frames(Spr_Katana_8S_recovery); // 100% informational not used in logic

damage = 14;
hit_stun = 32;
block_stun = 12;
hit_push = 8;
block_push = 6;
freeze_duration = 16;
h_launch = 1;
v_launch = 10;

is_high = true;
is_sticky = true;
is_side_irrelevant = true;

hit_sound = Snd_Hit2;
block_sound = Snd_Heavy_Block;