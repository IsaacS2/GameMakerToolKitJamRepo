/// @description Draw enemy and hat!
if (!right) {
	image_xscale = -1;
}
else {
	image_xscale = 1;
}

draw_self();
draw_sprite_ext(nextHatSprite, -1, x, y - hatDiff, image_xscale, 1, 1, c_white, 1);
