event_inherited();

startup = generate_sprite_frames(Spr_Batman_Sweep_startup); // 100% informational not used in logic
recovery = generate_sprite_frames(Spr_Batman_Sweep_recovery); // 100% informational not used in logic

damage = 12;
hit_stun = 32;
block_stun = 16;
hit_push = 6;
block_push = 4;
freeze_duration = 4;
h_launch = 1;
v_launch = -6;

is_low = true;
is_launcher = true;
effect = Obj_Batman_Sweep_hit_eff;
hit_effect_y = 16;

hit_sound = Snd_Hit2;
block_sound = Snd_Heavy_Block;