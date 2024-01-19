event_inherited();

x += h_velocity*image_xscale*logic_time;

if(spawner != noone){
	if(spawner.action == "stunned"){
		instance_destroy();
	}
}