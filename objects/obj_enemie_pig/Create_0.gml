/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();
is_walking = choose(true, false);
speed_enemie = choose(1, -1);
if(is_walking){
	speed_h = choose(speed_enemie, -speed_enemie);
} else {
	speed_h = 0
}


time_walking = game_get_speed(gamespeed_fps) * 2;
