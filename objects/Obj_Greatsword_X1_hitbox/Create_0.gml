event_inherited();

startup = generate_sprite_frames(Spr_Greatsword_X_startup); // 100% informational not used in logic
recovery = generate_sprite_frames(Spr_Greatsword_X_whiff); // 100% informational not used in logic

damage = 0;
hit_stun = 1;
block_stun = 0;
hit_push = 0;
block_push = 0;
freeze_duration = 1;
h_launch = 0;
v_launch = 0;

penetration = 1;
is_sticky = true;
extra_freeze_duration = 60;

swing_sound = Snd_NOTHING;
hit_sound = Snd_Block1;