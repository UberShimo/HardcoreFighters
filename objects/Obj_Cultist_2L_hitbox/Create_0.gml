event_inherited();

startup = generate_sprite_frames(Spr_Cultist_2L_startup); // 100% informational not used in logic
recovery = generate_sprite_frames(Spr_Cultist_2L_recovery); // 100% informational not used in logic

damage = 5;
hit_stun = 20;
block_stun = 8;
hit_push = 6;
block_push = 4;
freeze_duration = 8;
h_launch = 1;
v_launch = -5;

hit_effect_y = -8;
effect = Obj_Cultist_2L_hit_eff;

swing_sound = Snd_Light_Swing;