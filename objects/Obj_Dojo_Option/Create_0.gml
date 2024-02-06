gets_picked = function(){
	global.arena = Dojo_Place;
	global.character_select = Character_Select_Dojo;
	global.chaos_mode = false;
	global.min_players = 1;
	global.max_players = 8;
	global.dojo_level = 0;
	room_goto(global.character_select);
}