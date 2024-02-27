event_inherited();

startup = generate_sprite_frames(Spr_Batman_Headbutt_startup); // 100% informational not used in logic
recovery = generate_sprite_frames(Spr_Batman_Headbutt_recovery); // 100% informational not used in logic
info = "Unstoppable headbutt";

damage = 15;
hit_stun = 24;
block_stun = 12;
hit_push = 4;
block_push = 4;
freeze_duration = 8;
h_launch = 0;
v_launch = 2;

is_high = true;

hit_effect_y = 16;

hit_sound = Snd_Crack;
block_sound = Snd_Heavy_Block;