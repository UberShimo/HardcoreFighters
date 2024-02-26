event_inherited();

startup = generate_sprite_frames(Spr_Katana_Quickdraw_startup); // 100% informational not used in logic
recovery = generate_sprite_frames(Spr_Katana_Quickdraw_recovery); // 100% informational not used in logic

damage = 12;
hit_stun = 24;
block_stun = 12;
hit_push = 5;
block_push = 3;
freeze_duration = 12;
h_launch = 4;
v_launch = -6;

is_final = true;
effect = Obj_Katana_Quickdraw_hit_eff;
