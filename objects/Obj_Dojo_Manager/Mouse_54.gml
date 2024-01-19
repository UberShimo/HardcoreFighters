/// @description Test spawn hitbox
if(global.is_debugging){
	logic_time = 1;
	index = 1;
	meter_gain = 1;
	action = "noone";
	land_spr = Spr_EMPTY;

	att = instance_create_depth(mouse_x, mouse_y, depth, Obj_Greatsword_5L_hitbox);
	att.initiate(self);
	att.image_xscale = -1;
}