// Check for characters
for(i = 0; i < instance_number(Parent_Character); i++){
	characters[i] = instance_find(Parent_Character, i);
}

biggest_x = 0;
for(i = 0; i < array_length(characters); i++){
	character = instance_find(Parent_Character, i);
	if(character.x > biggest_x){
		biggest_x = character.x;
	}
}

smallest_x = biggest_x;
for(i = 0; i < array_length(characters); i++){
	character = instance_find(Parent_Character, i);
	if(character.x < smallest_x){
		smallest_x = character.x;
	}
}
biggest_y = 0;
for(i = 0; i < array_length(characters); i++){
	character = instance_find(Parent_Character, i);
	if(character.y > biggest_y){
		biggest_y = character.y;
	}
}

smallest_y = biggest_y;
for(i = 0; i < array_length(characters); i++){
	character = instance_find(Parent_Character, i);
	if(character.y < smallest_y){
		smallest_y = character.y;
	}
}

camera_width = biggest_x+extra_screen_size - (smallest_x-extra_screen_size);
if(camera_width < min_screen_size){
	camera_width = min_screen_size;
}
camera_height = camera_width * (1/global.screen_ratio);

camera_set_view_size(view_camera[0], camera_width, camera_height);

x_pos = (smallest_x + biggest_x)/2 - camera_width/2;
y_pos = (smallest_y + biggest_y)/2 - camera_height/2 - screen_extra_height;
if(x_pos < 0){
	x_pos = 0;
}
else if(x_pos+camera_width > room_width){
	x_pos = room_width-camera_width;
}
camera_set_view_pos(view_camera[0], x_pos, y_pos);