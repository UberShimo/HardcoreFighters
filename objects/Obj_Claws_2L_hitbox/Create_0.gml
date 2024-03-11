event_inherited();

startup = generate_sprite_frames(Spr_Claws_2L_startup); // 100% informational not used in logic
recovery = generate_sprite_frames(Spr_Claws_2L_recovery); // 100% informational not used in logic

damage = 10;
hit_stun = 22;
block_stun = 12;
hit_push = 3;
block_push = 2;
freeze_duration = 8;
h_launch = 2;
v_launch = -6;

is_sticky = true;
is_launcher = true;

block_sound = Snd_Heavy_Block;