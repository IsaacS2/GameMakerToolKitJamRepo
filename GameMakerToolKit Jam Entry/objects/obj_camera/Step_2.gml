/// @description Moving player's camera!
//
// Thanks to PixelatedPope for camera code
// found in "GMS2 Cameras: As Simple as Possible"
// https://www.youtube.com/watch?v=_g1LQ6aIJFk
//
#macro view0 view_camera[0]
camera_set_view_size(view0, game_room_width, game_room_height);

camera_set_view_pos(view0, room_width / 2, room_height / 2);

