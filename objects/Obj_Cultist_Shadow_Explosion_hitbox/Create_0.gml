event_inherited();

startup = generate_sprite_frames(Spr_Batman_5S_startup); // 100% informational not used in logic
recovery = generate_sprite_frames(Spr_Batman_5S_recovery); // 100% informational not used in logic

damage = 16;
hit_stun = 20;
block_stun = 12;
hit_push = 12;
block_push = 12;
freeze_duration = 12;
h_launch = 5;
v_launch = -3;

penetration = 1;
is_launcher = true;
is_shockwave = true;
shockwave_power = 10;
effect = Obj_Cultist_Shadow_Explosion_hit_eff;