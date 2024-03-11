event_inherited();

startup = generate_sprite_frames(Spr_Batman_High_startup); // 100% informational not used in logic
recovery = generate_sprite_frames(Spr_Batman_High_recovery); // 100% informational not used in logic

damage = 16;
hit_stun = 32;
block_stun = 12;
hit_push = 5;
block_push = 2;
freeze_duration = 12;
h_launch = 5;
v_launch = 7;

is_high = true;

hit_sound = Snd_Hit2;
block_sound = Snd_Heavy_Block;