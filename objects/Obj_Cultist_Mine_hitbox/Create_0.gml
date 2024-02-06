event_inherited();

startup = generate_sprite_frames(Spr_Cultist_Mine_startup); // 100% informational not used in logic
recovery = generate_sprite_frames(Spr_Cultist_Mine_recovery); // 100% informational not used in logic

damage = 16;
hit_stun = 40;
block_stun = 12;
hit_push = 12;
block_push = 12;
freeze_duration = 12;
h_launch = 0;
v_launch = -12;

penetration = 1;
is_launcher = true;
effect = Obj_Cultist_Mine_hit_eff;