hitbox = Obj_Blank_hitbox;

event_inherited();

air_ok = false;
air_only = false;
info = "Launch a ring. Ring flies\ndifferent depending on input.";
movement_input = Spr_EMPTY;
button_input = Spr_Skyring_Input;
image = Spr_Claws_Skyring_recovery;
extra_image = Spr_Claws_Skyring;
extra_image_x = -16;
extra_image_y = -24;
frame = 1;