projectileCnt++;
if (projectileCnt >= projectileTimeLimit && global.powerUp == 1) {
	instance_create_layer(x, y, "Instances", obj_player_projectile);
	projectileCnt = 0;
}