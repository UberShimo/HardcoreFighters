// Initiate character select

// Reset arrays
for(i = 0; i < 8; i++){
	global.picked_characters[i] = noone;
	global.controller_indexes[i] = -1;
	global.is_CPU[i] = false;
}

max_pickers = 8;

global.reset_controllers();

audio_stop_all();