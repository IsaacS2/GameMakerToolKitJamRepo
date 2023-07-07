function func_player_horizontal_check(_right, _maxDistance) {
	var i = _maxDistance;
	if (_right) {
		while (i > 0) {
			if (!place_meeting(x + i , y, obj_par_block)) {
				x += i;
				exit;
			}
			--i;
		}
	}
	else {
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
		if (keyRight) {
			func_player_horizontal_check(true, _speed);
			right = true;
		}
		else {
			func_player_horizontal_check(false, _speed);
			right = false;
		}
	}
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
	/*
	if (place_meeting(x, floor(y + vspd), obj_par_block) || place_meeting(x, ceil(y + vspd), obj_par_block)) {
		if (vspd < 0) {
			y = floor(y);
			var i = ceil(vspd);
			while (place_meeting(x, y + i, obj_par_block)) {
				++i;
			}
			y += i;
			vspd = 0;
		}
		else if (vspd > 0) {
			y = ceil(y);
			var i = floor(vspd);
			while (place_meeting(x, y + i, obj_par_block)) {
				--i;
			}
			y += i;
			vspd = 0;
			state = func_free_state;
			exit;
		}
	}
	*/
	else if (vspd < maxGravityPull) {
		vspd = min(maxGravityPull, vspd + normalGravityAcceleration);
	}
	y += vspd;
}

function func_player_vertical_movement() {
	func_player_vertical_check();
}