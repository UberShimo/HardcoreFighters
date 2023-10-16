index = -1;
spawner = noone;
spawner_action = noone;
object_time = 1; // % based
logic_time = 1; // % based
active_frames = 8;
hit_effect_scale = 1;
hit_effect_time = 1;
freeze_amount = 0; // % in time (0.1 = 10% time speed)
shake_amount = 0;
startup = 0; // 100% informational not used in logic
recovery = 0; // 100% informational not used in logic
sprite = noone; // Image/sprite to show when viewing the move
info = ""; // Information about the move
// Normal stats
damage = 0;
meter_gain = 0;
meter_gain_multiplier = 1; // % based
hit_stun = 0;
block_stun = 0;
hit_push = 0;
block_push = 0;
freeze_duration = 0;
h_launch = 0;
v_launch = 0;
h_velocity = 0;
v_velocity = 0;
is_low = false; // Must crouch to block
is_high = false; // Must stand to block
is_side_irrelevant = false; // Means you dont need to block the right way to block it
is_launcher = false; // Lifts opponent if they are hit
is_projectile = false;
is_sticky = false; // Sticks to spawner
is_cancelable = false; // Can cancel move even if you dont hit anything (informational)
is_final = false; // Cannot be canceled into other moves (informational)
penetration = 0; // % based, 1 = unblockable
effect = noone; // Hit effect or whatever that is left behind after attack
hit_effect_y = 0; // Makes hit effect spawn between opponent and this y value

// Methods
initiate = function(initiator){
	index = initiator.index;
	spawner = initiator;
	spawner_action = spawner.action;
	image_xscale = initiator.image_xscale;
	meter_gain = damage*meter_gain_multiplier;
	
	if(effect != noone){
		eff = instance_create_depth(x, y, depth, effect);
		eff.image_xscale = image_xscale;
	}
	
	if(is_cancelable){
		initiator.can_cancel = true;
	}
	
	if(is_final){
		initiator.cancels = 0;
	}
	
	if(initiator.debugging){
		visible = true;
		image_alpha = 0.5;
		depth = -5;
	}
}
