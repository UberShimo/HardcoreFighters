event_inherited();

startup = generate_sprite_frames(Spr_Greatsword_ULTRA_startup); // 100% informational not used in logic
recovery = generate_sprite_frames(Spr_Greatsword_ULTRA_recovery); // 100% informational not used in logic

damage = 20;
hit_stun = 24;
block_stun = 12;
hit_push = 4;
block_push = 4;
freeze_duration = 8;
h_launch = 1;
v_launch = 10;

is_high = true;
penetration = 0.3;
is_sticky = true;
meter_gain_multiplier = 0;

hit_sound = Snd_Crack;
block_sound = Snd_Heavy_Block;