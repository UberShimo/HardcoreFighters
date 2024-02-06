if(Obj_Dojo_Manager.student.rb_hold){
	instance_create_depth(x, y, depth-1, Eff_Nice);
	instance_create_depth(x, y, depth, Obj_ULTRA_Tutorial);
	instance_destroy();
}

if(Obj_Dojo_Manager.student.meter < 25){
	Obj_Dojo_Manager.student.meter = 26;
}