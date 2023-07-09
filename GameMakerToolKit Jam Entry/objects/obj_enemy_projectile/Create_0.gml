/// @description Projectile speed and direction set!
right = true;
speedX = 2;
width = 12;
if (instance_exists(obj_enemy_normal)) {
	if (!obj_enemy_normal.right) {
		right = false;
	}
}


