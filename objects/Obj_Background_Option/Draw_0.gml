draw_self();

if(place_meeting(x, y, Obj_Menu_Picker)){
	if(global.BG == BG_Mauntains){
		draw_sprite_ext(BG_Mauntains, 0, x+spr_width, y, 0.2, 0.2, 0, c_white, 1);
	}
	else if(global.BG == BG_Forest){
		draw_sprite_ext(BG_Forest, 0, x+spr_width, y, 0.2, 0.2, 0, c_white, 1);
	}
	else if(global.BG == BG_Night){
		draw_sprite_ext(BG_Night, 0, x+spr_width, y, 0.2, 0.2, 0, c_white, 1);
	}
	else{
		draw_sprite_ext(BG_Black, 0, x+spr_width, y, 0.2, 0.2, 0, c_white, 1);
	}
}