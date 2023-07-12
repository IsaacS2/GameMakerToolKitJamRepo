/// @description power-up stats!
func_add_powerup = function() {
	if (instance_exists(obj_player) && !captured) {
		obj_player.weightVal += weightIncrease;
	}
}

powerupType = 0;

if (object_get_name(object_index) == "obj_powerup_offense") {
	powerupType = 1;
}
else if (object_get_name(object_index) == "obj_powerup_speed") {
	powerupType = 2;
}
else if (object_get_name(object_index) == "obj_powerup_defense") {
	powerupType = 3;
}

right = true;
captured = false;
saved = false;
timeLimit = 600;
projectileTimeLimit = 60;
projectileCnt = 0;
weightIncrease = 1;
scoreIncrease = 1;
topDiff = 10;
depth = -1;