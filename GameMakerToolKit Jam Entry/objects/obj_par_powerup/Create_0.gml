/// @description power-up stats!
func_add_powerup = function() {
	obj_player.weightVal += weightIncrease;
	instance_destroy();
}

captured = false;
saved = false;
timeLimit = 600;
projectileTimeLimit = 60;
projectileCnt = 0;
weightIncrease = 1;
scoreIncrease = 1;
depth = -1;