event_inherited();

startup = generate_sprite_frames(Spr_Bow_2L_startup); // 100% informational not used in logic
recovery = generate_sprite_frames(Spr_Bow_2L_recovery); // 100% informational not used in logic

damage = 9;
hit_stun = 20;
block_stun = 8;
hit_push = 6;
block_push = 4;
freeze_duration = 8;
h_launch = 0.5;
v_launch = -5.5;

is_launcher = true;
hit_effect_y = -8;