spr_width = sprite_get_width(sprite_index);

gets_picked = function(){
	if(global.battle_music == Mu_Metalgroove){
		global.battle_music = Mu_Shred;
		play_music(global.battle_music, global.music_volume);
	}
	else if(global.battle_music == Mu_Shred){
		global.battle_music = Mu_Dumb_n_Bass;
		play_music(global.battle_music, global.music_volume);
	}
	else if(global.battle_music == Mu_Dumb_n_Bass){
		global.battle_music = Mu_Orc;
		play_music(global.battle_music, global.music_volume);
	}
	else if(global.battle_music == Mu_Orc){
		global.battle_music = Mu_Anger;
		play_music(global.battle_music, global.music_volume);
	}
	else if(global.battle_music == Mu_Anger){
		global.battle_music = Mu_Tutorial;
		play_music(global.battle_music, global.music_volume);
	}
	else if(global.battle_music == Mu_Tutorial){
		global.battle_music = Mu_Metalgroove;
		play_music(global.battle_music, global.music_volume);
	}
}