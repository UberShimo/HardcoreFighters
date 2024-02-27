event_inherited();

startup = generate_sprite_frames(Spr_Greatsword_Earth_S_startup); // 100% informational not used in logic
recovery = generate_sprite_frames(Spr_Greatsword_Earth_S_recovery); // 100% informational not used in logic

damage = 30;
hit_stun = 40;
block_stun = 32;
hit_push = 8;
block_push = 8;
freeze_duration = 16;
h_launch = 1.5;
v_launch = 10;

is_high = true;

hit_sound = Snd_Crack;
block_sound = Snd_Heavy_Block;