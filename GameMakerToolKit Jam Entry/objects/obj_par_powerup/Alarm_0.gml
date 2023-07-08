/// @description Destroy powerup
if (global.powerUp == 2 && instance_exists(obj_player)) {
	obj_player.movementSpeed -= obj_player.powerDashSpeed;
}
global.powerUp = 0;
func_add_powerup();