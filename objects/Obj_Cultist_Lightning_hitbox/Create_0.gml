event_inherited();

startup = generate_sprite_frames(Spr_Cultist_8S_startup); // 100% informational not used in logic
recovery = generate_sprite_frames(Spr_Cultist_8S_recovery); // 100% informational not used in logic

damage = 18;
hit_stun = 24;
block_stun = 20;
hit_push = 2;
block_push = 2;
freeze_duration = 16;
h_launch = 0;
v_launch = 6;

is_high = true;
penetration = 0.5;
shake_amount = 6;
extra_freeze_duration = 32;
effect = Obj_Cultist_Lightning_hit_eff;

swing_sound = Snd_Crack;
hit_sound = Snd_Smack;
block_sound = Snd_Heavy_Block;