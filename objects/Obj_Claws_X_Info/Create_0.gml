hitbox = Obj_Blank_hitbox;

event_inherited();

air_ok = true;
air_only = false;
info = "Return to previous position\nand regain you cancels.";
movement_input = Spr_EMPTY;
button_input = Spr_M;
image = Spr_Claws_Teleport_startup;
frame = 0;
meter_cost = 50;