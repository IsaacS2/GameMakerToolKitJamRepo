/// @description Resolution/aspect ratio calculations
// Special thanks to PixelatedPope for Gamemaker-related
// screen-resizing explanations and code found in both 
// "Resolution and Aspect Ratio Management for Game Maker - Part 3" 
// and "GMS2 Cameras: As Simple as Possible"
// https://www.youtube.com/watch?v=wv3R2Q536ZU
// https://www.youtube.com/watch?v=_g1LQ6aIJFk
//
display_width = display_get_width();
display_height = display_get_height();
ideal_height = game_room_height;
ideal_width = game_room_width;
zoom = 1;
max_zoom = 1;

aspect_ratio = display_width / display_height;
ideal_height = round(ideal_width / aspect_ratio);
max_zoom = floor (display_height / ideal_height);

window_set_size(ideal_width, ideal_height);

audio_play_sound(_8_bit_dream_land, 100, true);

room_goto_next();