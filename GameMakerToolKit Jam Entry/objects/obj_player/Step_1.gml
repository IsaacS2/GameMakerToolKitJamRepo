/// @description Input values obtained and player moved!
keyCharge = (keyboard_check(vk_up) || keyboard_check(ord("W")) 
		|| keyboard_check(vk_down) || keyboard_check(ord("S"))) 
		&& (slamCnt <= 0);
keySlam = (keyboard_check_released(vk_up) || keyboard_check_released(ord("W")) 
		|| keyboard_check_released(vk_down) || keyboard_check_released(ord("S"))) 
		&& chargeCnt > 0;
keyLeft = keyboard_check(vk_left) || keyboard_check(ord("A"))
keyRight = keyboard_check(vk_right) || keyboard_check(ord("D"));

platformBelow = place_meeting(x, y + 1, obj_par_block);

state();