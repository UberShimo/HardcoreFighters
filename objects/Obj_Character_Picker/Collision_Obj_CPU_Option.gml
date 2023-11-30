if(gamepad_button_check_pressed(controller_index, gp_face1)){
	if(global.is_CPU[other.index]){
		global.is_CPU[other.index] = false;
	}
	else{
		cpu_index = other.index;
		is_picking_for_cpu = true;
		connection = other;
		other.connection = self;
	}
}