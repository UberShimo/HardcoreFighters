event_inherited();

x += h_velocity*logic_time;
y += v_velocity*logic_time;

v_velocity += weight*logic_time;

if(abs(h_velocity) < max_speed){
	h_velocity += h_acceleration*logic_time;
}
