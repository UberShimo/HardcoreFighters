event_inherited();

spawner = noone;
action = noone;
index = -1;
time_to_bite_buffer = 0;
action_alarm = 0;
recover_alarm = 0;

move_speed = 3;

action_trigger = function(){
	if(action == "Bite"){
		attack = instance_create_depth(x, y, 0, Obj_Cultist_Shadow_Bite_hitbox);
		attack.initiate(self);
		
		sprite_index = Spr_Cultist_Shadow_Bite_recovery;
		image_index = 0;
		recover_alarm = generate_sprite_frames(sprite_index);
	}
}

// Move to ground
while(!place_meeting(x, y+1, Parent_Collision)){
	y += 1;
}