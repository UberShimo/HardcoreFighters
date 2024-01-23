dir = point_direction(other.x, other.y, x, y);

h_velocity = lengthdir_x(8, dir);
v_velocity = lengthdir_y(8, dir);

spawner.can_cancel = true;

instance_destroy(other);