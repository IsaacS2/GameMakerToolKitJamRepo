/// @description Player values and functions
#macro min_jump 4

// state functions
func_free_state = function() {
	if (sprite_index != nextSprite) {
		sprite_index = nextSprite;
	}
	if (platformBelow) {
		func_player_charge_check();
		if (keySlam) {
			nextHandSprite = spriteHandSlamming;
			if (chargeCnt >= jumpChargeTime) {
				if ((keyRight && right) || (keyLeft && !right)) { 
					movementSpeed += runSpeed;
				}
				vspd -= jumpHeight;
			}
			instance_create_layer(x, y + 8, "Instances", obj_wave_player);
			slamRecoverCnt++;
			slamAttackCnt++;
			chargeCnt = 0;
		}
	}
	if (vspd != 0 || !platformBelow) {
		if (slamRecoverCnt <= 0) {
			nextHandSprite = spriteHandIdle;
		}
		slamRecoverCnt = 0;
		chargeCnt = 0;
		turningCnt = 0;
		nextSprite = spriteAir;
		state = func_in_air_state;
		func_player_horizontal_check(right, movementSpeed);
		exit;
	} 
	func_player_horizontal_movement(movementSpeed);
}

func_turning_state = function() {
	if (sprite_index != nextSprite) {
		sprite_index = nextSprite;
	}
	func_player_charge_check();
	turningCnt++;
	if (keySlam) {  // stop charge
		chargeCnt = 0;
		slamRecoverCnt = 0;
		nextHandSprite = spriteHandIdle;
	}
	if (turningCnt >= turningTime) {
		turningCnt = 0;
		nextSprite = spriteFree;
		state = func_free_state;
	}
}

func_in_air_state = function() {
	if (sprite_index != nextSprite) {
		sprite_index = nextSprite;
	}
	func_player_vertical_movement();
	func_player_horizontal_check(right, movementSpeed);
}

/*
func_slamming_state = function() {
	if (sprite_index != nextSprite) {
		sprite_index = nextSprite;
	}
	slamRecoverCnt++;
	if (slamRecoverCnt >= slamRecoverTime) {
		slamRecoverCnt = 0;
		nextHandSprite = spriteHandIdle;
		state = func_free_state;
		nextSprite = spriteFree;
		movementSpeed = base_horizontal_speed;
	}
	if (!platformBelow) {
		slamRecoverCnt = 0;
		nextHandSprite = spriteHandIdle;
		nextSprite = spriteAir;
		state = func_in_air_state;
		movementSpeed = base_horizontal_speed;
	} 
	func_player_horizontal_check(right, movementSpeed);
}
*/

// Input values
keyCharge = false;
keyLeft = false;
keyRight = false;
keySlam = false;
turningTime = 7;
slamAttackTime = 8;
slamRecoverTime = 35;
jumpChargeTime = 15;
turningCnt = 0;
slamAttackCnt = 0;
slamRecoverCnt = 0;
chargeCnt = 0;
weightVal = 0;
speedDrop = 2;

// Player variables
movementSpeed = base_horizontal_speed;
runSpeed = 1;  // added onto movementSpeed when holding direction
jumpHeight = 5;
powerDashSpeed = 2;
vspd = 0;
normalGravityAcceleration = .2;
maxGravityPull = 4;
right = true;
platformBelow = true;
width = 16;
height = 16;
spriteFree = spr_player_idle;
spriteAir = spr_player_airborne;
spriteTurning = spr_player_turning;
spriteCharging = spr_player_charging;
spriteSlamming = spr_player_slamming;
nextSprite = spriteFree;
state = func_free_state;

// hand sprites
spriteHandIdle = spr_player_hand_idle;
spriteHandCharging = spr_player_hand_charging;
spriteHandSlamming = spr_player_hand_slamming;
spriteHandRecovering = spr_player_hand_recovering;
nextHandSprite = spriteHandIdle;