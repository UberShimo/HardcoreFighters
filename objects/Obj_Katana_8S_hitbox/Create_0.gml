event_inherited();

startup = generate_sprite_frames(Spr_Katana_8S_startup); // 100% informational not used in logic
recovery = generate_sprite_frames(Spr_Katana_8S_recovery); // 100% informational not used in logic

damage = 20;
hit_stun = 32;
block_stun = 12;
hit_push = 12;
block_push = 8;
freeze_duration = 16;
h_launch = 1;
v_launch = 10;

is_high = true;
is_sticky = true;

block_sound = Snd_Heavy_Block;