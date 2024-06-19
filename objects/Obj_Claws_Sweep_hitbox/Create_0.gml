event_inherited();

startup = generate_sprite_frames(Spr_Claws_Sweep_startup); // 100% informational not used in logic
recovery = generate_sprite_frames(Spr_Claws_Sweep_recovery); // 100% informational not used in logic

damage = 18;
hit_stun = 32;
block_stun = 16;
hit_push = 4;
block_push = 4;
freeze_duration = 12;
h_launch = 1;
v_launch = -6;

is_launcher = true;
is_low = true;
is_sticky = true;

block_sound = Snd_Heavy_Block;