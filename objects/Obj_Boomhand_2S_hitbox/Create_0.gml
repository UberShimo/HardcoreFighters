event_inherited();

startup = generate_sprite_frames(Spr_Batman_2S_startup); // 100% informational not used in logic
recovery = generate_sprite_frames(Spr_Batman_2S_recovery); // 100% informational not used in logic

damage = 16;
hit_stun = 32;
block_stun = 12;
hit_push = 12;
block_push = 12;
freeze_duration = 12;
h_launch = 3;
v_launch = -10;

is_launcher = true;
is_sticky = true;
effect = Obj_Boomhand_2S_hit_eff;