event_inherited();

startup = generate_sprite_frames(Spr_Bow_Sweep_startup); // 100% informational not used in logic
recovery = generate_sprite_frames(Spr_Bow_Sweep_recovery); // 100% informational not used in logic

damage = 8;
hit_stun = 36;
block_stun = 16;
hit_push = 4;
block_push = 4;
freeze_duration = 4;
h_launch = 1;
v_launch = -12;

is_low = true;
is_launcher = true;
effect = Obj_Bow_Sweep_hit_eff;
hit_effect_y = 16;

block_sound = Snd_Heavy_Block;