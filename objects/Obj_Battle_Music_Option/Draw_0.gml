draw_self();

if(place_meeting(x, y, Obj_Menu_Picker)){
	draw_sprite(Spr_Note, 0, x+spr_width+16, y+16);
	
	x_text_draw = x+spr_width+32;
	if(global.battle_music == Mu_Metalgroove){
		draw_text(x_text_draw, y, "Metal groove");
	}
	else if(global.battle_music == Mu_Shred){
		draw_text(x_text_draw, y, "Shredded Redemption");
	}
	else if(global.battle_music == Mu_Dumb_n_Bass){
		draw_text(x_text_draw, y, "Dumb n Bass");
	}
	else if(global.battle_music == Mu_Orc){
		draw_text(x_text_draw, y, "Orc Ester");
	}
	else if(global.battle_music == Mu_Anger){
		draw_text(x_text_draw, y, "Angry Menu Theme");
	}
	else if(global.battle_music == Mu_Tutorial){
		draw_text(x_text_draw, y, "Tutorial Song");
	}
}