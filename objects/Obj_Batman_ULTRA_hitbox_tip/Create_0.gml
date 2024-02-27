event_inherited();

startup = generate_sprite_frames(Spr_Batman_ULTRA_startup); // 100% informational not used in logic
recovery = generate_sprite_frames(Spr_Batman_ULTRA_recovery); // 100% informational not used in logic

damage = 100;
hit_stun = 32;
block_stun = 12;
hit_push = 12;
block_push = 12;
freeze_duration = 32;
h_launch = 4;
v_launch = -2;

shake_amount = 32;
penetration = 1;
meter_gain_multiplier = 0;
is_priority = true;
active_frames = 4;

hit_effect_y = -8;

hit_sound = Snd_Smack;