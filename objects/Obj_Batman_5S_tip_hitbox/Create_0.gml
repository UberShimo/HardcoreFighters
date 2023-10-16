event_inherited();

startup = generate_sprite_frames(Spr_Batman_5F_startup); // 100% informational not used in logic
recovery = generate_sprite_frames(Spr_Batman_5F_recovery); // 100% informational not used in logic

damage = 10;
hit_stun = 20;
block_stun = 16;
hit_push = 16;
block_push = 16;
freeze_duration = 12;
h_launch = 12;
v_launch = -6;

is_launcher = true;
penetration = 0.5;

hit_effect_y = -8;