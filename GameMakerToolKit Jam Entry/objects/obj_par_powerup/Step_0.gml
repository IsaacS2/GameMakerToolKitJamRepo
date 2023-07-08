/// @description attach to player!
if (!saved && place_meeting(x, y, obj_player)) {
	saved = true;
	global.highScore += scoreIncrease;
	depth = 1;
	if (object_get_name(object_index) == "obj_powerup_normal") {
		func_add_powerup();
		exit;
	}
	else if (object_get_name(object_index) == "obj_powerup_offense") {
		global.powerUp = 1;
		alarm[0] = timeLimit;
	}
	else if (object_get_name(object_index) == "obj_powerup_speed") {
		if (instance_exists(obj_player)) {
			obj_player.movementSpeed += obj_player.powerDashSpeed;
		}
		global.powerUp = 2;
		alarm[0] = timeLimit;
	}
	else if (object_get_name(object_index) == "obj_powerup_defense") {
		global.powerUp = 3;
	}
}

if (saved && instance_exists(obj_player)) {
	x = obj_player.x;
	y = obj_player.y - 8;
}