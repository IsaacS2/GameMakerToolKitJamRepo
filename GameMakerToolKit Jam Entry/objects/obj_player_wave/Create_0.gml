/// @description Shock wave values!
depth = -1;
despawnTime = 5;
despawnCnt = 0;
right = true;
if (instance_exists(obj_player)) {
	if (!obj_player.right) {
		right = false;
	}
}
