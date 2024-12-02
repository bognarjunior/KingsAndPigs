/// @description Insert description here
// You can write your code in this editor

if(is_dead){
	
	sprite_index = spr_enemie_pig_dead;
	
	if(image_speed <= 0){
		image_alpha -= 0.01
	}
	
	if(image_alpha <=0){
		instance_destroy()
	}
	
	exit;
}

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
		
		time_walking = game_get_speed(gamespeed_fps) * 2;
	}
	
	
	if(speed_h != 0 && !is_damage){
		sprite_index = spr_enemie_pig_run;
		image_xscale = sign(speed_h);
	} else {
		sprite_index = spr_enemie_pig_idle;
	}
	
	if(place_meeting(x + speed_h, y, obj_floor)){
		speed_h *= -1;
	}
	
	if(!can_fall){
		if(!place_meeting(x + (speed_h * 10), y + 1, obj_floor)){
			speed_h *= -1;
		}
	}
	
} else {
	speed_v += gravity_game;
	speed_h = 0;
	
	if(speed_h != 0){
		image_xscale = sign(speed_h);
	}
}

if(is_damage && !is_dead){
	sprite_index = spr_enemie_pig_hit;
	speed_h = 0;
}