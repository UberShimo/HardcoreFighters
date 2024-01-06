logic_time = object_time * global.game_time;

image_speed = logic_time;

if(time_reset_alarm > 0){
	time_reset_alarm -= global.game_time;
	
	if(time_reset_alarm <= 0){
		time_reset_alarm = 0;
		
		object_time = 1;
		shake_amount = 0;
	}
}