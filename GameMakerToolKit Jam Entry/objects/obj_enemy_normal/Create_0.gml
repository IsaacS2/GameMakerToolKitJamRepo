/// @description Enemy values initialized!

// enemy states
func_free_state = function() {
	if (platformBelow && place_meeting(x, y, obj_wave_player)) {
		if (specialPowerup == 3) {
			iFramed = true;
			alarm[0] = iFrameTimer;
			specialPowerup = 0;
			nextHatSprite = spriteHatNormal;
		}
		else if (!iFramed) {
			stunned = true;
			state = func_stunned_state;
			if (powerupsEaten > 0) {
				projectileCnt = 0;
				specialPowerup = 0;
				if (specialPowerup == 0) {
					instance_create_layer(x, y, "Instances", obj_powerup_normal);
				}
				else if (specialPowerup == 1) {
					instance_create_layer(x, y, "Instances", obj_powerup_normal);
				}
				else if (specialPowerup == 2) {
					instance_create_layer(x, y, "Instances", obj_powerup_normal);
				}
				else if (specialPowerup == 3) {
					instance_create_layer(x, y, "Instances", obj_powerup_normal);
				}
				powerupsEaten--;
				specialPowerup = 0;
				nextHatSprite = spriteHatNormal;
			}
			state();
			exit;
		}
	}
	else {
		iFramed = false;
	}
	if (triggerTouched && jump && instance_exists(obj_player)) {
		if (obj_player.y + playerHeightDiffVal < y) {
			vspd -= jumpHeight;
		}
		else if (directionChanged && obj_player.y <= y) {
			func_reset_direction_change();
		}
	}
	jump = false;
	if (vspd != 0 || !platformBelow) {
		state = func_in_air_state;
		if (vspd >= 1 && directionChanged) {
			func_reset_direction_change();
		}
	} 
	if (specialPowerup == 2) {
		func_enemy_horizontal_movement(movementSpeed + powerDashSpeed);
	}
	else {
		func_enemy_horizontal_movement(movementSpeed);
	}
}

func_in_air_state = function() {
	func_enemy_vertical_movement();
	func_enemy_horizontal_movement(movementSpeed);
}

func_stunned_state = function() {
	stunnedCnt++;
	if (stunnedCnt >= stunnedTimeLimit) {
		stunned = false;
		state = func_free_state;
		stunnedCnt = 0;
	}
}

movementSpeed = base_horizontal_speed;
powerDashSpeed = 1;
jumpHeight = 5;
vspd = 0;
normalGravityAcceleration = .2;
maxGravityPull = 4;
right = true;
width = 16;
height = 32;
triggerTouched = false;
directionChanged = false;
iFramed = false;
iFrameTimer = 30;
playerHeightDiffVal = 20;
jumpTurnVal = -2;
stunned = false;
projectileTimeLimit = 60;
stunnedTimeLimit = 30;
projectileCnt = 0;
stunnedCnt = 0;
jump = false;
powerupsEaten = 0;
specialPowerup = 0;
hatDiff = 13;

spriteHatNormal = spr_hat_normal;
spriteHatOffense = spr_hat_offense;
spriteHatSpeed = spr_hat_speed;
spriteHatDefense = spr_hat_defense;
nextHatSprite = spriteHatNormal;

state = func_free_state;