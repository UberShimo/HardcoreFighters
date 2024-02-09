hitbox = Obj_Bow_Boomerang_hitbox;

event_inherited();

air_ok = false;
air_only = false;
info = "Throw a boomerang. Hitting it with an arrow\nwill make it bounce toward opponent.\nAngle depends on input. Hold to throw it further";
movement_input = Spr_EMPTY;
button_input = Spr_Boomerang_Input;
image = Spr_Bow_Boomerang_Throw_recovery;
frame = 0;