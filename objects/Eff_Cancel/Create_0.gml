object_time = 1;
logic_time = 1;
fade = 0.02;
image_speed = 0;

initiate = function(initiator){
	sprite_index = initiator.sprite_index;
	image_index = initiator.image_index;
	image_xscale = initiator.image_xscale;
	
	if(initiator.cancels == 1){
		image_blend = c_orange;
	}
	else if(initiator.cancels == 0){
		image_blend = c_red;
	}
	
	eff = instance_create_depth(x, y, depth, Eff_Ring);
	eff.image_blend = image_blend;
	eff.grow *= 3;
}