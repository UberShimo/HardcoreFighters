event_inherited();

// Check if it is blocked
if(object_exists(Obj_Block_Tutorial) && other.is_blocking
&& other.down_hold && other.image_xscale != image_xscale){
	Obj_Block_Tutorial.blocks += 1;
	instance_destroy();
}