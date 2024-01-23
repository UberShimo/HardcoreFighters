event_inherited();

spawner = noone;
action = noone;
time_to_bite_buffer = 0;
action_alarm = 0;
recover_alarm = 0;

move_speed = 3;

action_trigger = function(){
	if(action == "Bite"){
		// Super explosion
		if(place_meeting(x, y, Obj_Cultist_Mine)){
			attack = instance_create_depth(x, y+64, 0, Obj_Cultist_Shadow_Explosion_hitbox);
			attack.initiate(self);
		}
		// Heal
		else if(place_meeting(x, y, spawner)){
			spawner.action = "Heal";
			spawner.action_alarm = 1;
			spawner.h_velocity = 0;
			spawner.x = x;
			spawner.y = y;
		}
		// Just bite
		else{
			attack = instance_create_depth(x, y, 0, Obj_Cultist_Shadow_Bite_hitbox);
			attack.initiate(self);
			attack.index = spawner.index; // Kinda ugly solution
		}
		
		sprite_index = Spr_Cultist_Shadow_Bite_recovery;
		image_index = 0;
		recover_alarm = generate_sprite_frames(sprite_index);
	}
}

// Move to ground
while(!place_meeting(x, y+1, Parent_Collision)){
	y += 1;
}