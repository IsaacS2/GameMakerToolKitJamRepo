/// @description Enemy values initialized!

// enemy states
func_free_state = function() {
	if (sprite_index != nextSprite) {
		sprite_index = nextSprite;
	}
	if (platformBelow && place_meeting(x, y, obj_player_wave)) {
		if (specialPowerup == 3) {
			iFramed = true;
			alarm[0] = iFrameTimer;
			specialPowerup = -1;
			nextHatSprite = spriteHatNormal;
		}
		else if (!iFramed) {
			stunned = true;
			nextSprite = spriteStunned;
			state = func_stunned_state;
			if (powerupsEaten > 0) {
				projectileCnt = 0;
				var _powerupReleased = instance_create_layer(x, y, "Instances", obj_powerup_normal);
				if (specialPowerup == 0) {
					_powerupReleased.sprite_index = spr_powerup_normal_dead;
				}
				else if (specialPowerup == 1) {
					_powerupReleased.sprite_index = spr_powerup_offense_dead;
				}
				else if (specialPowerup == 2) {
					_powerupReleased.sprite_index = spr_powerup_speed_dead;
				}
				else if (specialPowerup == 3 || specialPowerup == -1) {
					_powerupReleased.sprite_index = spr_powerup_defense_dead;
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
		nextSprite = spriteAir;
	} 
	if (specialPowerup == 2) {
		func_enemy_horizontal_movement(movementSpeed + powerDashSpeed);
	}
	else {
		func_enemy_horizontal_movement(movementSpeed);
	}
}

func_in_air_state = function() {
	if (sprite_index != nextSprite) {
		sprite_index = nextSprite;
	}
	func_enemy_vertical_movement();
	func_enemy_horizontal_movement(movementSpeed);
}

func_stunned_state = function() {
	if (sprite_index != nextSprite) {
		sprite_index = nextSprite;
	}
	stunnedCnt++;
	if (stunnedCnt >= stunnedTimeLimit) {
		sprite_index = spriteFree;
		nextSprite = spriteFree;
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
projectileTimeLimit = 90;
stunnedTimeLimit = 30;
projectileCnt = 0;
stunnedCnt = 0;
jump = false;
powerupsEaten = 0;
specialPowerup = 0;
hatDiff = 13;

spriteFree = spr_enemy_normal_idle;
spriteAir = spr_enemy_normal_airborne;
spriteStunned = spr_enemy_normal_stunned;
nextSprite = spriteFree;
spriteHatNormal = spr_hat_normal;
spriteHatOffense = spr_hat_offense;
spriteHatSpeed = spr_hat_speed;
spriteHatDefense = spr_hat_defense;
nextHatSprite = spriteHatNormal;

state = func_free_state;