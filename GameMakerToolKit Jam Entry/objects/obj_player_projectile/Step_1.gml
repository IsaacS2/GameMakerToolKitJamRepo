/// @description Move!
if (right) {
	x += speedX;
}
else {
	x -= speedX;
}

if (x > room_width + width || x < -width) {
	instance_destroy();
	exit;
}

if (place_meeting(x, y, obj_par_enemy)) {
	while (place_meeting(x, y, obj_par_enemy)) {
		var _enemyHit = instance_nearest(x, y, obj_par_enemy);
		while (_enemyHit.powerupsEaten > 0) {
			instance_create_layer(_enemyHit.x, _enemyHit.y, "Instances", obj_powerup_normal);
			_enemyHit.powerupsEaten--;
		}
		instance_destroy(_enemyHit);
		global.highScore++;
	}
	instance_destroy();
}