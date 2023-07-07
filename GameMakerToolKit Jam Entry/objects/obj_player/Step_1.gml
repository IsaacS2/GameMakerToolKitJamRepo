/// @description Input values obtained and player moved!
keySlam = keyboard_check_pressed(vk_up) || keyboard_check_pressed(ord("W")) 
		|| keyboard_check_pressed(vk_down) || keyboard_check_pressed(ord("S"));
keyLeft = keyboard_check(vk_left) || keyboard_check(ord("A"));
keyRight = keyboard_check(vk_right) || keyboard_check(ord("D"));

platformBelow = place_meeting(x, y + 1, obj_par_block);

state();