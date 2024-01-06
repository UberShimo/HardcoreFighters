event_inherited();

startup = generate_sprite_frames(Spr_Batman_8F_startup); // 100% informational not used in logic
recovery = generate_sprite_frames(Spr_Batman_8F_recovery); // 100% informational not used in logic

damage = 0;
hit_stun = 20;
block_stun = 0;
hit_push = 0;
block_push = 0;
freeze_duration = 0;
h_launch = 0;
v_launch = 0;

penetration = 1;
is_sticky = true;