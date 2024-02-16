hitbox = Obj_Blank_hitbox;

event_inherited();

air_ok = true;
air_only = false;
info = "Dash and leave CIRCLE behind you.\nIf circle touches STAR it implodes.";
movement_input = Spr_EMPTY;
button_input = Spr_Earth_Input;
image = Spr_Cultist_Circledash_Forward_recovery;
frame = 0;

is_cancelable = true;