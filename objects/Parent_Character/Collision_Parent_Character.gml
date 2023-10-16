if(is_collidable && other.is_collidable){
	if(x < other.x && h_velocity > 0){
		x = other.x-(other.character_width/2);
	}
	else if(x > other.x && h_velocity < 0){
		x = other.x+(other.character_width/2);
	}
}