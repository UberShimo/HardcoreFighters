event_inherited();

startup = generate_sprite_frames(Spr_Cultist_8S_startup); // 100% informational not used in logic
recovery = generate_sprite_frames(Spr_Cultist_8S_recovery); // 100% informational not used in logic

damage = 10;
hit_stun = 24;
block_stun = 20;
hit_push = 2;
block_push = 2;
freeze_duration = 20;
h_launch = 0;
v_launch = 5;

is_high = true;
effect = Obj_Cultist_Lightning_hit_eff;