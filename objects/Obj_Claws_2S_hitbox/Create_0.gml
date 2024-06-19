event_inherited();

startup = generate_sprite_frames(Spr_Claws_2S_startup); // 100% informational not used in logic
recovery = generate_sprite_frames(Spr_Claws_2S_recovery); // 100% informational not used in logic

damage = 8;
hit_stun = 46;
block_stun = 16;
hit_push = 4;
block_push = 12;
freeze_duration = 4;
h_launch = 1;
v_launch = -12;

is_launcher = true;
is_sticky = true;

block_sound = Snd_Heavy_Block;