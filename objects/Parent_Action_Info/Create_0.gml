// Must inherit this shit after hitbox is created

hr = instance_create_depth(x, y, 0, hitbox); // Hitbox Reference

damage = hr.damage;
startup = hr.startup;
recovery = hr.recovery;
hit_stun = hr.hit_stun;
block_stun = hr.block_stun;
penetration = hr.penetration;
is_projectile = hr.is_projectile;
is_high = hr.is_high;
is_low = hr.is_low;
is_launcher = hr.is_launcher;
is_cancelable = hr.is_cancelable;
is_final = hr.is_final;

instance_destroy(hr);

// Initiated afterwards
air_ok = false;
air_only = false;
info = "";
movement_input = Spr_EMPTY;
button_input = Spr_EMPTY;
image = Spr_EMPTY;
extra_image = Spr_EMPTY;
frame = 0;
meter_cost = 0;

image_speed = 0;

// Draw variables
input_offset = 24;
digit_offset = 6;
