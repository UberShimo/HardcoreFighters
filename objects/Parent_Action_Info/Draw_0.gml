draw_self();

// Draw action image
draw_sprite(image, frame, x+64, y+64);
draw_sprite_ext(extra_image, 0, x+64+extra_image_x, y+64+extra_image_y, extra_image_scale, extra_image_scale, 0, extra_image_color, 1);
