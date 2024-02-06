event_inherited();

startup = generate_sprite_frames(Spr_Boomhand_Sweep_startup); // 100% informational not used in logic
recovery = generate_sprite_frames(Spr_Boomhand_Sweep_recovery); // 100% informational not used in logic

damage = 0;
hit_stun = 32;
block_stun = 16;
hit_push = 4;
block_push = 4;
freeze_duration = 4;
h_launch = 0;
v_launch = -8;

is_low = true;
is_launcher = true;
hit_effect_scale = 0;
penetration = 1;
