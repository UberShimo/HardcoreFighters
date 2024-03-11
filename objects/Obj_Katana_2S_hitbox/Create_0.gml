event_inherited();

startup = generate_sprite_frames(Spr_Katana_2S_startup); // 100% informational not used in logic
recovery = generate_sprite_frames(Spr_Katana_2S_recovery); // 100% informational not used in logic

damage = 15;
hit_stun = 40;
block_stun = 20;
hit_push = 0;
block_push = 12;
freeze_duration = 16;
h_launch = 1;
v_launch = -12;

is_launcher = true;
is_sticky = true;

hit_sound = Snd_Hit2;
block_sound = Snd_Heavy_Block;