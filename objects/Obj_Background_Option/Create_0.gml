spr_width = sprite_get_width(sprite_index);

gets_picked = function(){
	if(global.BG == BG_Black){
		global.BG = BG_Mauntains;
	}
	else if(global.BG == BG_Mauntains){
		global.BG = BG_Forest;
	}
	else if(global.BG == BG_Forest){
		global.BG = BG_Night;
	}
	else if(global.BG == BG_Night){
		global.BG = BG_Black;
	}
}