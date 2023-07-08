/// @description enemy moved!
platformBelow = place_meeting(x, y + 1, obj_par_block);

if (!triggerTouched && place_meeting(x, y, obj_trigger_enemy)) {
	triggerTouched = true;
	if (instance_exists(obj_player)) {
		if ((obj_player.x < x && right) || (obj_player.x > x && !right)) {
			directionChanged = true;
		} 
		else {
			directionChanged = false;
		}
	}
}
else if (triggerTouched && !place_meeting(x, y, obj_trigger_enemy)) {
	triggerTouched = false;
}

state();

/*
if (directionChanged && ) {
	
}
*/