x -= h_velocity;
y -= v_velocity;

// Copy stats to new ball
new_ball = instance_create_depth(x, y, depth, Obj_Batman_Superball);
new_ball.h_velocity = h_velocity;
new_ball.v_velocity = v_velocity;
new_ball.index = index;
new_ball.damage = damage;
new_ball.hit_stun = hit_stun;
new_ball.hit_push = hit_push;
new_ball.block_stun = block_stun;
new_ball.block_push = block_push;
new_ball.is_active = is_active;
new_ball.weight = weight;
new_ball.spawner = spawner;
new_ball.lifespan = lifespan; // IMPORTANT

if(place_meeting(x+h_velocity, y, Parent_Collision)){
	new_ball.h_velocity *= -0.8;
}
if(place_meeting(x, y+v_velocity, Parent_Collision)){
	new_ball.v_velocity *= -0.8;
}
if(!place_meeting(x+h_velocity*2, y, Parent_Collision)){
	new_ball.x += h_velocity*2;
}
if(!place_meeting(x, y+v_velocity*2, Parent_Collision)){
	new_ball.y += v_velocity*2;
}

instance_destroy();