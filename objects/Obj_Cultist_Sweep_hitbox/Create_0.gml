event_inherited();

startup = generate_sprite_frames(Spr_Batman_Sweep_startup); // 100% informational not used in logic
recovery = generate_sprite_frames(Spr_Batman_Sweep_recovery); // 100% informational not used in logic

damage = 10;
hit_stun = 32;
block_stun = 16;
hit_push = 4;
block_push = 4;
freeze_duration = 4;
h_launch = 2;
v_launch = -6;

is_sticky = true;
is_low = true;
is_launcher = true;
hit_effect_y = 16;
