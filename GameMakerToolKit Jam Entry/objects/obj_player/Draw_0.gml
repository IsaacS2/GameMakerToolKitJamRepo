/// @description Draw sprite and hand!
if (!right) {
	image_xscale = -1;
}
else {
	image_xscale = 1;
}
draw_self();
draw_sprite_ext(nextHandSprite, -1, x, y - 2, image_xscale, 1, 0, c_white, 1);
