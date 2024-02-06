if(high_done && sweep_done){
	instance_create_depth(x, y, depth-1, Eff_Nice);
	instance_create_depth(x, y, depth, Obj_Meter_Dash_Tutorial);
	instance_destroy();
}

if(Obj_Dojo_Manager.student.action == "High"){
	high_done = true;
}
if(Obj_Dojo_Manager.student.action == "Sweep"){
	sweep_done = true;
}