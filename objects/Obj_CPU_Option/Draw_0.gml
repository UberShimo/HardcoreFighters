draw_self();

draw_text_color(x+24, y+8, "P"+string(index+1), c_black, c_black, c_black, c_black, 1);

if(connection != noone){
	spr_offset = sprite_get_width(sprite_index)/2;
	draw_line(x+spr_offset, y+spr_offset, connection.x+spr_offset, connection.y+spr_offset);
}