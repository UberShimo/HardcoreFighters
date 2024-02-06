event_inherited();

startup = generate_sprite_frames(Spr_Cultist_L_startup); // 100% informational not used in logic
recovery = generate_sprite_frames(Spr_Cultist_L_recovery); // 100% informational not used in logic

damage = 10;
hit_stun = 24;
block_stun = 12;
hit_push = 4;
block_push = 2;
freeze_duration = 8;
h_launch = 3;
v_launch = -2;

effect = Obj_Cultist_L_hit_eff;
image_xscale = 1.5;