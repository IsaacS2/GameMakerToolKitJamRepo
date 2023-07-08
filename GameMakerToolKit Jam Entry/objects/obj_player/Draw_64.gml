/// @description Draw weight values!
draw_set_halign(fa_left);
draw_text(10, 10, weightVal);
draw_set_halign(fa_right);
draw_text(display_get_gui_width() - 10, 10, global.highScore);
draw_text(display_get_gui_width() - 10, display_get_gui_height() - 20, global.powerUp);