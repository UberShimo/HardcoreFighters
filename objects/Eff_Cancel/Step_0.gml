logic_time = object_time*global.game_time;

image_alpha -= fade*logic_time;

if(image_alpha <= 0){
	instance_destroy();
}