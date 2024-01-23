event_inherited();

damage_alarm -= logic_time;
if(damage_alarm <= 0){
	damage_alarm = damage_alarm_time;
	
	if(instance_exists(zombie)){
		zombie.HP -= 1;
		if(zombie.HP <= 0){
			instance_create_depth(zombie.x, zombie.y, 0, Eff_Ring);
			instance_destroy(zombie);
			instance_destroy();
		}
	}
	else{
		instance_destroy();
	}
}
