/// @description display score!
if (room == lastRoom) {
	draw_set_halign(fa_right);
	draw_text(display_get_gui_width() - 10, 10, "Score: " + string(global.highScore));
}