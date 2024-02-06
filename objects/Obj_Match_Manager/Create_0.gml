player_amount = 0;
ui_pixel_size = 1;
global.game_time = 1; // Just reset time for safety

for(i = 0; i < 8; i++){
	players[i] = noone;
}

global_time_reset_alarm = 0;

// Methods
// Kinda complicated actually...
check_for_winner = function(){
	for(i = 0; i < player_amount; i++){
		if(players[i].hearts <= 0){
			instance_destroy(players[i]);
			player_amount -= 1;
				
			if(i != player_amount){
				for(j = i; j <= player_amount; j++){
					players[j] = players[j+1];
				}
			}
		}
	}
	// Got a winner!!!
	if(player_amount == 1){
		// Menu alarm
		alarm[11] = 180;
	}
}