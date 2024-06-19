event_inherited();

startup = generate_sprite_frames(Spr_Katana_High_startup); // 100% informational not used in logic
recovery = generate_sprite_frames(Spr_Katana_High_recovery); // 100% informational not used in logic

damage = 22;
hit_stun = 30;
block_stun = 16;
hit_push = 8;
block_push = 8;
freeze_duration = 12;
h_launch = 4;
v_launch = 4;

is_high = true;
is_sticky = true;

hit_sound = Snd_Crack;
block_sound = Snd_Heavy_Block;