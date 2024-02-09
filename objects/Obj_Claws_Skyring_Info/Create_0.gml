hitbox = Obj_Blank_hitbox;

event_inherited();

air_ok = false;
air_only = false;
info = "Launch a ring. Ring flies different\ndepending on input";
movement_input = Spr_EMPTY;
button_input = Spr_Skyring_Input;
image = Spr_Claws_Skyring_recovery;
frame = 0;