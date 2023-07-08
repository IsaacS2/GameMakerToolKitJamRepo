/// @description Projectile speed and direction set!
right = true;
speedX = 3;
width = 12;
if (instance_exists(obj_player)) {
	if (!obj_player.right) {
		right = false;
	}
}


