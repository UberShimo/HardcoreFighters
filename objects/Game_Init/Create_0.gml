global.game_time = 1;
global.screen_ratio = 1.78; // 16:9
global.is_debugging = false;
global.chaos_mode = true;
global.heart_amount = 3;

// Global character stats
global.slippy_grip = 0.3;
global.standard_grip = 0.5;
global.steady_grip = 0.7;

global.light_weight = 0.6;
global.standard_weight = 0.7;
global.heavy_weight = 0.8;

global.short_height = 48;
global.standard_height = 64;
global.tall_height = 80;

// Player colors
global.p1_color = make_color_rgb(255, 0, 0);
global.p2_color = make_color_rgb(0, 255, 255);
global.p3_color = make_color_rgb(0, 255, 0);
global.p4_color = make_color_rgb(255, 0, 255);
global.p5_color = make_color_rgb(0, 0, 255);
global.p6_color = make_color_rgb(255, 255, 0);
global.p7_color = make_color_rgb(255, 102, 0);
global.p8_color = make_color_rgb(0, 102, 255);

// Initiate arrays
for(i = 0; i < 8; i++){
	global.picked_characters[i] = noone;
	global.controller_indexes[i] = -1;
	global.is_CPU[i] = false;
}

// Methods
global.reset_controllers = function(){
	for(i = 0; i < 8; i++){
		global.picked_characters[i] = noone;
		global.controller_indexes[i] = -1;
	}
}

room_goto(Main_Menu);