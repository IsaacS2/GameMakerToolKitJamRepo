function func_enemy_horizontal_check(_right, _maxDistance) {
	var i = _maxDistance;
	if (_right) {
		if (place_meeting(x + i , y, obj_block_wall) && platformBelow) {
			right = !right;
		}
		while (i > 0) {
			if (!place_meeting(x + i , y, obj_par_block)) {
				x += i;
				exit;
			}
			--i;
		}
	}
	else {
		if (place_meeting(x - i , y, obj_block_wall) && platformBelow) {
			right = !right;
		}
		while (i > 0) {
			if (!place_meeting(x - i , y, obj_par_block)) {
				x -= i;
				exit;
			}
			--i;
		}
	}
}

function func_enemy_horizontal_movement(_speed) {
	func_enemy_horizontal_check(right, _speed);
}

function func_reset_direction_change() {
	right = !right;
	directionChanged = !directionChanged;
}

function func_enemy_vertical_check() {
	// NOTE: change one if-statement to vspd (>/<)= 0 if vertical collision is off
	if (place_meeting(x, ceil(y + vspd), obj_par_block) && vspd > 0) {  // going down!
		y = ceil(y);
		var i = floor(vspd);
		while (place_meeting(x, y + i, obj_par_block)) {
			--i;
		}
		y += i;
		vspd = 0;
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
	
	if (directionChanged && vspd >= jumpTurnVal) {  // time to switch directions in the air!
		func_reset_direction_change();
	}
	y += vspd;
}

function func_enemy_vertical_movement() {
	func_enemy_vertical_check();
}