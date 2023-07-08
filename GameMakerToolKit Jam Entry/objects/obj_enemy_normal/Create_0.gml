/// @description Enemy values initialized!

// enemy states
func_free_state = function() {
	if (triggerTouched && instance_exists(obj_player)) {
		if (obj_player.y + playerHeightDiffVal < y) {
			vspd -= jumpHeight;
		}
		else if (directionChanged && obj_player.y <= y) {
			func_reset_direction_change();
		}
	}
	if (vspd != 0 || !platformBelow) {
		state = func_in_air_state;
		if (vspd >= 1 && directionChanged) {
			func_reset_direction_change();
		}
	} 
	func_enemy_horizontal_movement(movementSpeed);
}

func_in_air_state = function() {
	func_enemy_vertical_movement();
	func_enemy_horizontal_movement(movementSpeed);
}

movementSpeed = base_horizontal_speed;
runSpeed = 1;
jumpHeight = 5;
vspd = 0;
normalGravityAcceleration = .2;
maxGravityPull = 4;
right = true;
width = 16;
height = 32;
triggerTouched = false;
directionChanged = false;
playerHeightDiffVal = 8;
jumpTurnVal = -2;
// jump = false;

state = func_free_state;