event_inherited();

startup = generate_sprite_frames(Spr_Baller_5S_startup);
startup = generate_sprite_frames(Spr_Baller_5S_recovery);

damage = 16;
hit_stun = 32;
block_stun = 20;
hit_push = 0;
block_push = 0;
freeze_duration = 16;
h_launch = 0;
v_launch = 0;

active_frames = 0;

swing_sound = Snd_NOTHING;
block_sound = Snd_Heavy_Block;

// Ball stuff.
// also Ball hits are actually considired melee
ball = noone;