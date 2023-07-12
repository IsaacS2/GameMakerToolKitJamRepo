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
			var _powerupReleased = instance_create_layer(_enemyHit.x, _enemyHit.y, "Instances", obj_powerup_normal);
			if (_enemyHit.specialPowerup == 0) {
				_powerupReleased.sprite_index = spr_powerup_normal_dead;
			}
			else if (_enemyHit.specialPowerup == 1) {
				_powerupReleased.sprite_index = spr_powerup_offense_dead;
			}
			else if (_enemyHit.specialPowerup == 2) {
				_powerupReleased.sprite_index = spr_powerup_speed_dead;
			}
			else if (_enemyHit.specialPowerup == 3 || _enemyHit.specialPowerup == -1) {
				_powerupReleased.sprite_index = spr_powerup_defense_dead;
			}
			_enemyHit.specialPowerup = 0;
			_enemyHit.powerupsEaten--;
		}
		instance_destroy(_enemyHit);
		global.highScore++;
	}
	instance_destroy();
}