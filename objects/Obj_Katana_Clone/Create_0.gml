event_inherited();

is_collidable = false;
life_span = 24;

action_trigger = function(){
	if(action == "426L"){
		attack = instance_create_depth(x, y, 0, Obj_Katana_Quickdraw_hitbox);
		attack.initiate(self);
		
		sprite_index = Spr_Katana_Quickdraw_recovery;
		image_index = 0;
	}
}