/// @description Player values and functions

// state functions
func_free_state = function() {
	if (sprite_index != nextSprite) {
		sprite_index = nextSprite;
	}
	if (keySlam && platformBelow) {
		vspd -= jumpHeight;
	}
	if (vspd != 0 || !platformBelow) {
		state = func_in_air_state;
	} 
	func_player_horizontal_movement(movementSpeed);
}

func_in_air_state = function() {
	if (sprite_index != nextSprite) {
		sprite_index = nextSprite;
	}
	else {
		func_player_vertical_movement();
		func_player_horizontal_movement(movementSpeed);
	}
}

// Input values
keySlam = false;
keyLeft = false;
keyRight = false;

// Player variables
movementSpeed = 2;
runSpeed = 2;  // added onto movementSpeed when holding direction
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
nextSprite = spriteFree;
state = func_free_state;
