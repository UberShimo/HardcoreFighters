event_inherited();

index = -1;
life_span = 24;

#region Sprites
stand_spr = Spr_Katana_Stand;
forward_spr = Spr_Katana_Forward;
backward_spr = Spr_Katana_Backward;
dash_forward_spr = Spr_Katana_Dash_Forward;
dash_backward_spr = Spr_Katana_Dash_Backward;
crouch_spr = Spr_Katana_Crouch;
ascend_spr = Spr_Katana_Ascend;
descend_spr = Spr_Katana_Descend;
stunned_spr = Spr_Katana_Stunned;
launched_spr = Spr_Katana_Launched;
land_spr = Spr_Katana_Land;
block_spr = Spr_Katana_Block;
crouch_block_spr = Spr_Katana_Crouch_Block;
#endregion

// Fixed stats
HP = 100;
max_HP = HP;
meter = 0;
max_meter = 100;
hearts = global.heart_amount;
// Katana stats
dash_speed = 10;
dash_blink = 8;
dash_duration = 24;
dash_grip = 0.75;
grip = global.standard_grip;
air_grip = 0;
weight = global.light_weight;
character_width = 24;
character_height = global.standard_height;
shake_amount = 0;
player_color = c_white;

action = noone;
h_velocity = 0;
v_velocity = 0;
grounded = false;
action_alarm = 0;
cancels = 0;

lb_pressed = false;

action_trigger = function(){
	if(action == "426L"){
		attack = instance_create_depth(x, y, 0, Obj_Katana_Quickdraw_hitbox);
		attack.initiate(self);
		
		sprite_index = Spr_Katana_Quickdraw_recovery;
		image_index = 0;
		
		life_span = generate_sprite_frames(sprite_index);
	}
}