hitbox = Obj_Katana_Quickdraw_hitbox;

event_inherited();

air_ok = true;
air_only = false;
info = "Quickdraw! The angle of the move\ndepends on the input";
movement_input = Spr_EMPTY;
button_input = Spr_Quickdraw_Input;
image = Spr_Katana_Quickdraw_recovery;
extra_image = Spr_Katana_Quickdraw_hit_eff;
frame = 0;