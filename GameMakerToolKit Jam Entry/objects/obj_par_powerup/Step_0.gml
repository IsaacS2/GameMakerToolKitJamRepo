/// @description attach to player!
if (!saved && place_meeting(x, y, obj_player)) {
	saved = true;
	global.highScore += scoreIncrease;
	obj_player.powerupsCollected++;
	if (obj_player.powerupsCollected >= obj_control.powerupsInRoom) {
		room_goto_next();
	}
	depth = 1;
	if (powerupType == 0) {
		instance_destroy();
		exit;
	}
	else if (powerupType == 1) {
		global.powerUp = powerupType;
		alarm[0] = timeLimit;
	}
	else if (powerupType == 2) {
		if (instance_exists(obj_player)) {
			obj_player.movementSpeed += obj_player.powerDashSpeed;
		}
		global.powerUp = powerupType;
		alarm[0] = timeLimit;
	}
	else if (powerupType == 3) {
		global.powerUp = powerupType;
	}
}

if (saved && instance_exists(obj_player)) {
	x = obj_player.x;
	y = obj_player.y - halfHeight;
}