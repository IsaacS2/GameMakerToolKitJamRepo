/// @description enemy moved!
if (specialPowerup == 1) {
	projectileCnt++;
	if (projectileCnt >= projectileTimeLimit) {
		instance_create_layer(x, y, "Instances", obj_enemy_projectile);
		projectileCnt = 0;
	}
}

platformBelow = place_meeting(x, y + 1, obj_par_block);

if (!triggerTouched && place_meeting(x, y, obj_trigger_enemy)) {
	triggerTouched = true;
	jump = true;
	if (instance_exists(obj_player)) {
		if ((obj_player.x <= x && right) || (obj_player.x >= x && !right)) {
			directionChanged = true;
		} 
		else {
			directionChanged = false;
		}
	}
}
else if (triggerTouched && !place_meeting(x, y, obj_trigger_enemy)) {
	triggerTouched = false;
}

if (place_meeting(x, y, obj_par_powerup) && !stunned) {
	while (place_meeting(x, y, obj_par_powerup)) {
		var powerup = instance_nearest(x, y, obj_par_powerup);
		if (!powerup.saved) {
			powerupsEaten++;
			if (powerup.powerupType != 0) {  // special powerup obtained
				specialPowerup = powerup.powerupType;
				if (specialPowerup == 1) {
					nextHatSprite = spriteHatOffense;
				}
				else if (specialPowerup == 2) {
					nextHatSprite = spriteHatSpeed;
				}
				else if (specialPowerup == 3) {
					nextHatSprite = spriteHatDefense;
				}
			}
			powerup.captured = true;
			instance_destroy(powerup);
		}
		else {
			break;
		}
	}
}

state();
