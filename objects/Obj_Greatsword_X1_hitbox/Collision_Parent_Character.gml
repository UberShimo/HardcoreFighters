if(other.index != index){
	other.x = x+16*image_xscale;
	
	spawner.action = "X2";
	spawner.sprite_index = Spr_Greatsword_X_hit;
	spawner.image_index = 0;
	spawner.action_alarm = 32;
	spawner.recover_alarm = generate_sprite_frames(spawner.sprite_index);
	
	instance_destroy();
}