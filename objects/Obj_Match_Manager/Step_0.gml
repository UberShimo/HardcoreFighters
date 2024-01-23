if(global_time_reset_alarm > 0){
	global_time_reset_alarm -= 1;
	
	if(global_time_reset_alarm <= 0){
		global.game_time = 1;
	}
}