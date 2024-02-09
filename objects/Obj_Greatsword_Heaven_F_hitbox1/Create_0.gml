event_inherited();

startup = generate_sprite_frames(Spr_Greatsword_Heaven_F_startup); // 100% informational not used in logic
recovery = generate_sprite_frames(Spr_Greatsword_Heaven_F_recovery); // 100% informational not used in logic

damage = 6;
hit_stun = 12;
block_stun = 8;
hit_push = 6;
block_push = 4;
freeze_duration = 8;
h_launch = -4;
v_launch = -4;

is_launcher = true;
effect = Obj_Greatsword_Heaven_F_hit_eff;