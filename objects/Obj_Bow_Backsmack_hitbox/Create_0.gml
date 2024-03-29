event_inherited();

startup = generate_sprite_frames(Spr_Bow_Backsmack_startup); // 100% informational not used in logic
recovery = generate_sprite_frames(Spr_Bow_Backsmack_recovery); // 100% informational not used in logic
info = "Dash forward then hit behind you";

damage = 16;
hit_stun = 32;
block_stun = 16;
hit_push = 4;
block_push = 3;
freeze_duration = 8;
h_launch = 2;
v_launch = -4;

is_low = true;

hit_effect_y = 16;

hit_sound = Snd_Smack;
block_sound = Snd_Heavy_Block;