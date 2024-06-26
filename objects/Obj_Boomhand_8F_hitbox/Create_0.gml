event_inherited();

startup = generate_sprite_frames(Spr_Boomhand_8F_startup); // 100% informational not used in logic
recovery = generate_sprite_frames(Spr_Boomhand_8F_recovery); // 100% informational not used in logic

damage = 7;
hit_stun = 16;
block_stun = 8;
hit_push = 4;
block_push = 2;
freeze_duration = 8;
h_launch = 5;
v_launch = -2;

is_high = true;
is_sticky = true;

swing_sound = Snd_Light_Swing;