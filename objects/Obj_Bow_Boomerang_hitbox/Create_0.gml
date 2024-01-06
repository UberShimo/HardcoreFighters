event_inherited();

startup = generate_sprite_frames(Spr_Batman_Sweep_startup); // 100% informational not used in logic
recovery = generate_sprite_frames(Spr_Batman_Sweep_recovery); // 100% informational not used in logic

damage = 4;
hit_stun = 0;
block_stun = 0;
hit_push = 0;
block_push = 0;
freeze_duration = 0;
h_launch = 0;
v_launch = 0;

is_tick = true;
is_side_irrelevant = true;
swing_sound = Snd_NOTHING;
hit_sound = Snd_NOTHING;
hit_effect_scale = 0.25;
meter_gain_multiplier = 0;