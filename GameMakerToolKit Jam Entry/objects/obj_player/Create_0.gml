/// @description Player values and functions
#macro base_horizontal_speed 1

// state functions
func_free_state = function() {
	if (sprite_index != nextSprite) {
		sprite_index = nextSprite;
	}
	if (platformBelow) {
		if (keyCharge) {  // charging time!
			sprite_index = spriteCharging;
			chargeCnt++;
		} 
		if (keySlam) {
			if ((keyRight && right) || (keyLeft && !right)) { 
				movementSpeed += runSpeed;
			}
			if (chargeCnt >= jumpChargeTime) {
				vspd -= jumpHeight;
			}
			else {
				nextSprite = spriteSlamming;
				state = func_slamming_state;
			}
			instance_create_layer(x, y + 8, "Instances", obj_wave_player);
			slamCnt++;
			chargeCnt = 0;
		}
	}
	if (vspd != 0 || !platformBelow) {
		slamCnt = 0;
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
	turningCnt++;
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

func_slamming_state = function() {
	if (sprite_index != nextSprite) {
		sprite_index = nextSprite;
	}
	slamCnt++;
	if (slamCnt >= slamTime) {
		slamCnt = 0;
		state = func_free_state;
		nextSprite = spriteFree;
		movementSpeed = base_horizontal_speed;
	}
	if (!platformBelow) {
		slamCnt = 0;
		nextSprite = spriteAir;
		state = func_in_air_state;
		movementSpeed = base_horizontal_speed;
	} 
	func_player_horizontal_check(right, movementSpeed);
}

// Input values
keyCharge = false;
keyLeft = false;
keyRight = false;
turningTime = 7;
slamTime = 15;
jumpChargeTime = 20;
turningCnt = 0;
slamCnt = 0;
chargeCnt = 0;

// Player variables
movementSpeed = base_horizontal_speed;
runSpeed = 1;  // added onto movementSpeed when holding direction
jumpHeight = 4;
dashSpeed = 2;
vspd = 0;
normalGravityAcceleration = .3;
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
