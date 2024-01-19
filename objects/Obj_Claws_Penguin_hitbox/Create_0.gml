event_inherited();

startup = generate_sprite_frames(Spr_Claws_Sweep_startup); // 100% informational not used in logic
recovery = generate_sprite_frames(Spr_Claws_Sweep_recovery); // 100% informational not used in logic

damage = 10;
hit_stun = 20;
block_stun = 12;
hit_push = 5;
block_push = 5;
freeze_duration = 12;
h_launch = 2;
v_launch = -3;

is_low = true;
is_sticky = true;
active_frames = 24;