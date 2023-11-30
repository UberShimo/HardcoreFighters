logic_time = object_time*global.game_time;

image_alpha -= fade*logic_time;

if(image_alpha < 0){
	instance_destroy();
}

if(duration > 0){
	duration -= logic_time;
	
	if(duration <= 0){
		instance_destroy();
	}
}