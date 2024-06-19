event_inherited();

startup = generate_sprite_frames(Spr_Greatsword_Heaven_S_startup); // 100% informational not used in logic
recovery = generate_sprite_frames(Spr_Greatsword_Heaven_S_recovery); // 100% informational not used in logic

damage = 17;
hit_stun = 28;
block_stun = 16;
hit_push = 4;
block_push = 2;
freeze_duration = 16;
h_launch = 1;
v_launch = 12;

is_high = true;
is_sticky = true;
shake_amount = 2;

swing_sound = Snd_Smack;
hit_sound = Snd_Crack;
block_sound = Snd_Heavy_Block;