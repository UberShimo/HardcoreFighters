gets_picked = function(){
	global.arena = Arena_Cage;
	global.is_debugging = false;
	global.max_players = 1;
	room_goto(Character_Select);
}
