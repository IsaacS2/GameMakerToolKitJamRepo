if (room == lastRoom) {
	global.highScore = 0;
	global.powerUp = 0;
	game_end();
}
else if (room == firstRoom) {
	global.highScore = 0;
	global.powerUp = 0;
	room_goto_next();
}