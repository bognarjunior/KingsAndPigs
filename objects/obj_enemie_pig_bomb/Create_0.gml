/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

state = "idle"; // idle, run, pick, throw, hit
time_state = game_get_speed(gamespeed_fps) * 5;
timer_change_state = time_state;

see_player = function(){
	var _see_player = collision_line(x, y -14, x + 100 * image_xscale, y + 14, obj_player, false, true);
	
	if(_see_player){
		state = "throw"; 
	}
}
