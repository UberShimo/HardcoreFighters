event_inherited();

startup = generate_sprite_frames(Spr_Greatsword_8S_startup); // 100% informational not used in logic
recovery = generate_sprite_frames(Spr_Greatsword_8S_recovery); // 100% informational not used in logic

damage = 12;
hit_stun = 24;
block_stun = 20;
hit_push = 10;
block_push = 8;
freeze_duration = 24;
h_launch = 2;
v_launch = 10;

is_high = true;
is_sticky = true;

hit_sound = Snd_Crack;
block_sound = Snd_Heavy_Block;