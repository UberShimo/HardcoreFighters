if(Obj_Dojo_Manager.student.action == "High"){
	instance_create_depth(x, y, depth-1, Eff_Nice);
	instance_create_depth(x, y, depth, Obj_Meter_Dash_Tutorial);
	instance_destroy();
}