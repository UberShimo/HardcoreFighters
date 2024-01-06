if(other.index != index && !is_projectile && !is_final){
	spawner.can_cancel = true;
	if(spawner.down_hold && !spawner.grounded){
		spawner.v_velocity = spawner.max_fall_speed;
	}
}