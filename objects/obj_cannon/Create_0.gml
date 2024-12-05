/// @description Insert description here
// You can write your code in this editor
state = "idle";//idle, on, await

time_shot = game_get_speed(gamespeed_fps) * 5;
timer_shot_cannon = time_shot;

change_sprite = function(_sprite) {
	if(sprite_index != _sprite){
			sprite_index = _sprite;	
			image_index = 0;
		}
}