if(other != spawner){
	is_returning = true;
}
else if(can_be_cought && other.is_collidable){
	other.has_boomerang = true;
	instance_destroy();
}