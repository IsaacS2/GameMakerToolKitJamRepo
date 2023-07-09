function func_player_horizontal_check(_right, _maxDistance) {
	var i = _maxDistance;
	if (_right) {
		/*
		if (place_meeting(x + i , y, obj_par_block)) {
			right = !right;
		}
		*/
		while (i > 0) {
			if (!place_meeting(x + i , y, obj_par_block)) {
				x += i;
				exit;
			}
			--i;
		}
	}
	else {
		/*
		if (place_meeting(x - i , y, obj_par_block)) {
			right = !right;
		}
		*/
		while (i > 0) {
			if (!place_meeting(x - i , y, obj_par_block)) {
				x -= i;
				exit;
			}
			--i;
		}
	}
}

function func_player_horizontal_movement(_speed) {
	if (keyRight != keyLeft) {
		if ((keyRight && !right) || (keyLeft && right)) {
			right = !right;
			nextSprite = spriteTurning;
			state = func_turning_state;
			exit;
		}
		else {
			_speed += runSpeed;
		}
	}
	func_player_horizontal_check(right, _speed);
}

function func_player_vertical_check() {
	// NOTE: change one if-statement to vspd (>/<)= 0 if vertical collision is off
	if (place_meeting(x, ceil(y + vspd), obj_par_block) && vspd > 0) {  // going down!
		y = ceil(y);
		var i = floor(vspd);
		while (place_meeting(x, y + i, obj_par_block)) {
			--i;
		}
		y += i;
		vspd = 0;
		if (global.powerUp == 2) {
			movementSpeed = base_horizontal_speed + powerDashSpeed;
		}
		else {
			movementSpeed = base_horizontal_speed;
		}
		nextHandSprite = spriteHandIdle;
		nextSprite = spriteFree;
		state = func_free_state;
		exit;
	}
	else if (place_meeting(x, floor(y + vspd), obj_par_block) && vspd < 0) {
		y = floor(y);
		var i = ceil(vspd);
		while (place_meeting(x, y + i, obj_par_block)) {
			++i;
		}
		y += i;
		vspd = 0;
	}
	else if (vspd < maxGravityPull) {
		vspd = min(maxGravityPull, vspd + normalGravityAcceleration);
	}
	y += vspd;
}

function func_player_vertical_movement() {
	func_player_vertical_check();
}

function func_player_charge_check() {
	if (keyCharge) {  // charging time!
		nextHandSprite = spriteHandCharging;
		chargeCnt++;
	}
}

function func_player_return_to_idle() {
	nextHandSprite = spriteHandIdle;
	state = func_free_state;
	nextSprite = spriteFree;
}