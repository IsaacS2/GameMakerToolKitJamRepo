/// @description hit collision!
if (place_meeting(x, y, obj_par_enemy) && iFrameCnt <= 0) {
	var enemyTouched = instance_nearest(x, y, obj_par_enemy);
	if (!enemyTouched.stunned) {
		if (global.powerUp == 3) {
			global.powerUp = 0;
			if (instance_exists(obj_powerup_defense)) {
				instance_destroy(obj_powerup_defense);
			}
			iFrameCnt++;
		}
		else {
			global.highScore = 0;
			room_restart();
		}
	}
}

if (place_meeting(x, y, obj_enemy_projectile) && iFrameCnt <= 0) {
	if (global.powerUp == 3) {
		global.powerUp = 0;
		if (instance_exists(obj_powerup_defense) && 
		place_meeting(x, y, obj_powerup_defense)) {
			instance_destroy(obj_powerup_defense);
			iFrameCnt++;
		}
	}
	else {
		global.highScore = 0;
		room_restart();
	}
}

if (iFrameCnt >= iFrameTime) {
	iFrameCnt = 0;
}
else if (iFrameCnt > 0) {
	iFrameCnt++;
}
