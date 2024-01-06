event_inherited();

startup = generate_sprite_frames(Spr_Batman_Sweep_startup); // 100% informational not used in logic
recovery = generate_sprite_frames(Spr_Batman_Sweep_recovery); // 100% informational not used in logic

damage = 20;
hit_stun = 20;
block_stun = 16;
hit_push = 0;
block_push = 0;
freeze_duration = 12;
h_launch = 0;
v_launch = -4;

is_projectile = true;
meter_gain_multiplier = 0;