event_inherited();

startup = generate_sprite_frames(Spr_Greatsword_High_startup); // 100% informational not used in logic
recovery = generate_sprite_frames(Spr_Greatsword_High_recovery); // 100% informational not used in logic

damage = 35;
hit_stun = 32;
block_stun = 16;
hit_push = 5;
block_push = 2;
freeze_duration = 12;
h_launch = 2;
v_launch = 6;

is_high = true;

hit_sound = Snd_Crack;
block_sound = Snd_Heavy_Block;