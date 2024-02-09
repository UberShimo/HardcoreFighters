hitbox = Obj_Claws_Dive_hitbox;

event_inherited();

air_ok = false;
air_only = false;
info = "Teleport and dive from a ring\ndepending on input";
movement_input = Spr_EMPTY;
button_input = Spr_Dive_Input;
image = Spr_Claws_Dive_recovery;
frame = 0;