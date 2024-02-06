event_inherited();

connection = noone;

clicked = function(clicker){
	if(global.is_CPU[clicker.index]){
		global.is_CPU[clicker.index] = false;
	}
	else{
		clicker.cpu_index = index;
		clicker.is_picking_for_cpu = true;
		clicker.connection = self;
		connection = clicker;
	}
}