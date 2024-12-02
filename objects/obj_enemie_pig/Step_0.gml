/// @description Insert description here
// You can write your code in this editor

var _floor = place_meeting(x, y + 1 , obj_floor);

if(_floor){
	
	time_walking -= 1;
	if(time_walking <= 0){
		is_walking = choose(true, false);
		
		if(is_walking){
			speed_h = choose(speed_enemie, -speed_enemie);
		} else {
			speed_h = 0
		}
		
		//speed_enemie = choose(1,-1);
		time_walking = game_get_speed(gamespeed_fps) * 2;
	}
	
	
	if(speed_h != 0){
		sprite_index = spr_enemie_pig_run;
		image_xscale = sign(speed_h);
	} else {
		sprite_index = spr_enemie_pig_idle;
	}
	
	if(place_meeting(x + speed_h, y, obj_floor)){
		speed_h *= -1;
	}
	
} else {
	speed_v += gravity_game;
	speed_h = 0;
	
	if(speed_h != 0){
		image_xscale = sign(speed_h);
	}
}