/// @description Insert description here
// You can write your code in this editor

var _floor = place_meeting(x, y + 1 , obj_floor);

if(_floor){
	speed_h = speed_enemie;
	if(speed_h != 0){
		sprite_index = spr_enemie_pig_run;
	 image_xscale = sign(speed_h);
	} else {
		sprite_index = spr_enemie_pig_idle;
	}
	
	
} else {
	speed_v += gravity_game;
	speed_h = 0
}