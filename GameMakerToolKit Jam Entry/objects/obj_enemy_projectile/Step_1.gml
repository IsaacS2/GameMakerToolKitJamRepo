/// @description Move!
if (right) {
	x += speedX;
}
else {
	x -= speedX;
}

if (x > room_width + width || x < -width) {
	instance_destroy();
}
