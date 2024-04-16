event_inherited();

startup = generate_sprite_frames(Spr_Boomhand_Groundsmash_startup); // 100% informational not used in logic
recovery = generate_sprite_frames(Spr_Boomhand_Groundsmash_recovery); // 100% informational not used in logic

damage = 2;
hit_stun = 12;
block_stun = 4;
hit_push = 0;
block_push = 0;
freeze_duration = 12;
h_launch = 0;
v_launch = -2;

is_low = true;
hit_effect_y = 32;
effect = Obj_Boomhand_Groundsmash_hit_eff;
shake_amount = 2;

swing_sound = Snd_Block1;