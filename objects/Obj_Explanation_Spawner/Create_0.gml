y_inc = 32
y_spawn = y;

instance_create_depth(x, y_spawn, 0, Obj_High_Explanation);
y_spawn += y_inc;
instance_create_depth(x, y_spawn, 0, Obj_Low_Explanation);
y_spawn += y_inc;
instance_create_depth(x, y_spawn, 0, Obj_Projectile_Explanation);
y_spawn += y_inc;
instance_create_depth(x, y_spawn, 0, Obj_Launcher_Explanation);
y_spawn += y_inc;
instance_create_depth(x, y_spawn, 0, Obj_Final_Explanation);
y_spawn += y_inc;
instance_create_depth(x, y_spawn, 0, Obj_Cancelable_Explanation);
y_spawn += y_inc;
instance_create_depth(x, y_spawn, 0, Obj_Penetration_Explanation);
y_spawn += y_inc;
instance_create_depth(x, y_spawn, 0, Obj_Meter_Cost_Explanation);
y_spawn += y_inc;
instance_create_depth(x, y_spawn, 0, Obj_Combo_Window_Explanation);
y_spawn += y_inc;

instance_destroy();