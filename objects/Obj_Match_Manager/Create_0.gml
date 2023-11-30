player_amount = 0;
ui_pixel_size = 1;

for(i = 0; i < 8; i++){
	players[i] = noone;
}

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
	// Menu alarm
	if(player_amount == 1){
		alarm[11] = 180;
	}
}