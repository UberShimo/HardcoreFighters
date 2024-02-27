event_inherited();

startup = generate_sprite_frames(Spr_Cultist_4L_startup); // 100% informational not used in logic
recovery = generate_sprite_frames(Spr_Cultist_4L_recovery); // 100% informational not used in logic

damage = 5;
hit_stun = 20;
block_stun = 12;
hit_push = 4;
block_push = 2;
freeze_duration = 8;
h_launch = 2;
v_launch = -3;

effect = Obj_Cultist_4L_hit_eff;

swing_sound = Snd_Light_Swing;