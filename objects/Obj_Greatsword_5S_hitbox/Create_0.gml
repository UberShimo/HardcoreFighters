event_inherited();

startup = generate_sprite_frames(Spr_Batman_5S_startup); // 100% informational not used in logic
recovery = generate_sprite_frames(Spr_Batman_5S_recovery); // 100% informational not used in logic

damage = 20;
hit_stun = 32;
block_stun = 32;
hit_push = 5;
block_push = 5;
freeze_duration = 24;
h_launch = 0;
v_launch = 0;

is_launcher = true;
hit_effect_y = -8;