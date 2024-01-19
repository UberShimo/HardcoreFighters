event_inherited();

duration -= logic_time;
if(duration <= 0){
	instance_destroy();
}

v_velocity += v_acc*logic_time;

x += h_velocity*logic_time;
y += v_velocity*logic_time;
