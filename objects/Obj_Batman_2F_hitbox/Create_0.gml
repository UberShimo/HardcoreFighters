event_inherited();

sprite = Spr_Batman_2F_recovery;
startup = generate_sprite_frames(Spr_Batman_2F_startup); // 100% informational not used in logic
recovery = generate_sprite_frames(Spr_Batman_2F_recovery); // 100% informational not used in logic

damage = 5;
hit_stun = 10;
block_stun = 4;
hit_push = 4;
block_push = 2;
freeze_duration = 4;
h_launch = 1;
v_launch = -1;

hit_effect_y = 16;