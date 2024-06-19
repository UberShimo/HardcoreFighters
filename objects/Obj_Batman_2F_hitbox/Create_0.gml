event_inherited();

startup = generate_sprite_frames(Spr_Batman_2F_startup); // 100% informational not used in logic
recovery = generate_sprite_frames(Spr_Batman_2F_recovery); // 100% informational not used in logic

damage = 4;
hit_stun = 16;
block_stun = 8;
hit_push = 4;
block_push = 2;
freeze_duration = 8;
h_launch = 1;
v_launch = -1;

is_sticky = true;
is_low = true;
hit_effect_y = 16;

swing_sound = Snd_Light_Swing;