global.game_time = 1;
global.screen_ratio = 1.78; // 16:9
global.is_debugging = false;
global.chaos_mode = false;
global.heart_amount = 3;
global.arena = Arena_Cage;
global.character_select = Character_Select_1v1;
global.min_players = 2;
global.max_players = 8;
global.dojo_level = 0; // 0:freeform 1:Basic 2:Advanced

// Global character stats
global.slippy_grip = 0.3;
global.standard_grip = 0.5;
global.steady_grip = 0.7;

global.light_weight = 0.55;
global.standard_weight = 0.7;
global.heavy_weight = 0.85;

global.short_height = 48;
global.standard_height = 64;
global.tall_height = 80;

// Player colors
global.p_colors[0] = make_color_rgb(255, 0, 0);
global.p_colors[1] = make_color_rgb(0, 255, 255);
global.p_colors[2] = make_color_rgb(0, 255, 0);
global.p_colors[3] = make_color_rgb(255, 0, 255);
global.p_colors[4] = make_color_rgb(0, 0, 255);
global.p_colors[5] = make_color_rgb(255, 255, 0);
global.p_colors[6] = make_color_rgb(255, 102, 0);
global.p_colors[7] = make_color_rgb(0, 102, 255);

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