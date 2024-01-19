event_inherited();

startup = generate_sprite_frames(Spr_Batman_Sweep_startup); // 100% informational not used in logic
recovery = generate_sprite_frames(Spr_Batman_Sweep_recovery); // 100% informational not used in logic

damage = 5;
hit_stun = 8;
block_stun = 4;
hit_push = 0;
block_push = 0;
freeze_duration = 8;
h_launch = 0;
v_launch = -2;

is_final = true;
is_low = true;
hit_effect_y = 32;
effect = Obj_Boomhand_Groundsmash_hit_eff;