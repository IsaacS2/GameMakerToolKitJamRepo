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
			instance_create_layer(x, y + 4, "Instances", obj_player_wave);
			slamRecoverCnt++;
			slamAttackCnt++;
			chargeCnt = 0;
			chargeHold = false;
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
	if (keySlam) {  // hold charge
		chargeHold = true;
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
	if (nextHandSprite == spriteHandRecovering) {
		nextHandSprite = spriteHandIdle;
	}
	func_player_vertical_movement();
	func_player_horizontal_check(right, movementSpeed);
}

// Input values
keyCharge = false;
keyLeft = false;
keyRight = false;
keySlam = false;
chargeHold = false;
turningTime = 7;
slamAttackTime = 8;
slamRecoverTime = 36;
jumpChargeTime = 12;
iFrameTime = 30;
turningCnt = 0;
slamAttackCnt = 0;
slamRecoverCnt = 0;
iFrameCnt = 0;
chargeCnt = 0;
weightVal = 0;
speedDrop = 2;
powerupsCollected = 0;

// Player variables
movementSpeed = base_horizontal_speed;
runSpeed = 1;  // added onto movementSpeed when holding direction
jumpHeight = 5;
powerDashSpeed = 1;
vspd = 0;
normalGravityAcceleration = .2;
maxGravityPull = 4;
platformBelow = true;
width = 12;
height = 12;
spriteFree = spr_player_idle;
spriteAir = spr_player_airborne;
spriteTurning = spr_player_turning;
spriteCharging = spr_player_idle;
spriteSlamming = spr_player_idle;
nextSprite = spriteFree;
state = func_free_state;

right = true;
if (x > room_width / 2) {
	right = false;
}
else {
	right = true;
}

// hand sprites
spriteHandIdle = spr_player_hand_idle;
spriteHandCharging = spr_player_hand_charging;
spriteHandChargingFull = spr_player_hand_charging_full;
spriteHandSlamming = spr_player_hand_slamming;
spriteHandRecovering = spr_player_hand_recovering;
nextHandSprite = spriteHandIdle;

// bag sprites
spriteBagEmpty = spr_sack_empty;
spriteBagFull = spr_sack_full;
bagSprite = spriteBagEmpty;