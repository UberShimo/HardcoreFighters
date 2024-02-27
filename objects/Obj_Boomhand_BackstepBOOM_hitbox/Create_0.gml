event_inherited();

startup = generate_sprite_frames(Spr_Boomhand_Backstep_startup); // 100% informational not used in logic
recovery = generate_sprite_frames(Spr_Boomhand_BackstepBOOM_recovery); // 100% informational not used in logic

damage = 20;
hit_stun = 20;
block_stun = 12;
hit_push = 10;
block_push = 8;
freeze_duration = 16;
h_launch = 8;
v_launch = -2;

is_sticky = true;
active_frames = 20;

block_sound = Snd_Heavy_Block;