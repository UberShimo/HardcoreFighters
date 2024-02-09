hitbox = Obj_Greatsword_Stomp_hitbox;

event_inherited();

air_ok = false;
air_only = false;
info = "Stomp and spawn a pillar.\nThe distance depend on what input\nis used. Hold to delay pillar.";
movement_input = Spr_EMPTY;
button_input = Spr_Stomp_Input;
image = Spr_Greatsword_Stomp_recovery;
frame = 0;