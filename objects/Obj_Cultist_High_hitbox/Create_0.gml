event_inherited();

startup = generate_sprite_frames(Spr_Cultist_High_startup); // 100% informational not used in logic
recovery = generate_sprite_frames(Spr_Cultist_High_recovery); // 100% informational not used in logic

damage = 14;
hit_stun = 38;
block_stun = 12;
hit_push = 5;
block_push = 2;
freeze_duration = 12;
h_launch = 1;
v_launch = 6;

is_high = true;

hit_sound = Snd_Crack;
block_sound = Snd_Heavy_Block;