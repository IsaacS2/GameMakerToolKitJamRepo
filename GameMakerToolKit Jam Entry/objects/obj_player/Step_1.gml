/// @description Input values obtained and player moved!
platformBelow = place_meeting(x, y + 1, obj_par_block);

if (weightVal >= speedDrop) {
	runSpeed = max(runSpeed - 1, 0);
	weightVal = 0;
}

if (slamRecoverCnt >= slamRecoverTime) {
	slamRecoverCnt = 0;
	nextHandSprite = spriteHandIdle;
} 
else if (slamRecoverCnt > 0 && slamAttackCnt <= 0) {
	nextHandSprite = spriteHandRecovering;
	slamRecoverCnt++;
}

if (slamAttackCnt >= slamAttackTime) {
	slamAttackCnt = 0;
	if (slamRecoverCnt == 0) {
		nextHandSprite = spriteHandIdle;
	}
}
else if (slamAttackCnt > 0) {
	nextHandSprite = spriteHandSlamming;
	slamAttackCnt++;
}

keyCharge = (keyboard_check(vk_up) || keyboard_check(ord("W")) 
		|| keyboard_check(vk_down) || keyboard_check(ord("S"))) 
		&& (slamRecoverCnt <= 0);
keySlam = ((keyboard_check_released(vk_up) || keyboard_check_released(ord("W")) 
		|| keyboard_check_released(vk_down) || keyboard_check_released(ord("S"))) 
		&& (chargeCnt > 0)) || chargeHold;
keyLeft = (keyboard_check(vk_left) || keyboard_check(ord("A")));
keyRight = (keyboard_check(vk_right) || keyboard_check(ord("D")));

state();