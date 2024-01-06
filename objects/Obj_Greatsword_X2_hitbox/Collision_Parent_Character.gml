if(other.index != index && ds_list_find_index(other.hitbox_list, self) == -1){
	if(other.meter > 25){
		other.meter -= 25;
	}
	else{
		other.meter = 0;
	}
}