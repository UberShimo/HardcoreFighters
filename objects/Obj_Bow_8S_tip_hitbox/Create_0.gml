event_inherited();

startup = generate_sprite_frames(Spr_Batman_8L_startup); // 100% informational not used in logic
recovery = generate_sprite_frames(Spr_Batman_8L_recovery); // 100% informational not used in logic

damage = 16;
hit_stun = 40;
block_stun = 20;
hit_push = 2;
block_push = 2;
freeze_duration = 30;
h_launch = 0;
v_launch = 12;

is_priority = true;
is_high = true;
shake_amount = 8;
effect = Obj_Bow_8S_hit_eff;