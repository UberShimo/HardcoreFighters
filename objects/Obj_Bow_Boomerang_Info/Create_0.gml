hitbox = Obj_Bow_Boomerang_hitbox;

event_inherited();

air_ok = false;
air_only = false;
info = "Boomerang. Arrows bounce on it!\nAngle depends on input.\nHold to throw it further.";
movement_input = Spr_EMPTY;
button_input = Spr_Boomerang_Input;
image = Spr_Bow_Boomerang_Throw_recovery;
extra_image = Spr_Bow_Boomerang;
extra_image_x = 64;
frame = 0;