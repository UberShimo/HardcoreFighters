event_inherited();

startup = generate_sprite_frames(Spr_Katana_ULTRA_startup); // 100% informational not used in logic
recovery = generate_sprite_frames(Spr_Katana_ULTRA_recovery); // 100% informational not used in logic

damage = 50;
hit_stun = 32;
block_stun = 0;
hit_push = 0;
block_push = 0;
freeze_duration = 32;
h_launch = 1;
v_launch = -2;

active_frames = 2;
shake_amount = 12;
penetration = 1;
is_final = true;
meter_gain_multiplier = 0;

effect = Obj_Katana_ULTRA_hit_eff;