function play_music(song, volume){
	audio_stop_all();
	audio_play_sound(song, 0, true, volume/2);
}