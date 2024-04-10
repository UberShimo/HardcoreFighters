event_inherited();

startup = generate_sprite_frames(Spr_Boomhand_Fistdive_startup); // 100% informational not used in logic
recovery = generate_sprite_frames(Spr_Boomhand_Fistdive_recovery); // 100% informational not used in logic

damage = 50;
hit_stun = 120;
block_stun = 12;
hit_push = 0;
block_push = 8;
freeze_duration = 24;
h_launch = 0.1;
v_launch = -20;

is_sticky = true;
is_launcher = true;
penetration = 0.5;
shake_amount = 8;

hit_sound = Snd_Crack;
block_sound = Snd_Heavy_Block;