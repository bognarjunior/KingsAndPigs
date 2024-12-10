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

switch(state){
	case "normal":
		var _bomb = instance_place(x, y, obj_bomb);
		var _cannon = instance_place(x, y, obj_cannon);
	
		if(_bomb && _floor){
			if(!is_picking_bomb){
				if(_bomb._stage == "off"){
					state = "lighting";
				}
			} else {
				instance_destroy(_bomb);
				var _new_pig = instance_create_layer(x, y, layer, obj_enemie_pig_bomb);
				_new_pig.state = "pick";
				instance_destroy();
			}
		}
	
		if(_cannon){
			if(_cannon.state == "idle"){
				state = "lightCannon";
			}
		}
	
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
	break;
	case "lighting":
		if(sprite_index != spr_enemie_pig_with_match){
			sprite_index = spr_enemie_pig_with_match;
			image_index = 0;
		}
	
		speed_h = 0;
	
		if(image_index >= image_number -1){
			state = "lightBomb"
		}
	break;
	case "lightBomb":
		if(sprite_index != spr_enemie_pig_match){
			sprite_index = spr_enemie_pig_match
			image_index = 0;
		}
	
		if(image_index >= image_number -1) {
		
			var _bomb_ = instance_place(x, y, obj_bomb);
			var _cannon_ = instance_place(x, y, obj_cannon);
		
			if(_bomb_){
				_bomb_._stage = "on"
				
				is_picking_bomb = choose(true, false);
			}
			
			if(_cannon_){
				_cannon_.state = "on"
			}
		
			state = "normal"; 
	
		}
	break;
	case "lightCannon":
		if(sprite_index != spr_enemie_pig_light_cannon){
			sprite_index = spr_enemie_pig_light_cannon;
			image_index = 0;
		}
	
		speed_h = 0;
	
		if(image_index >= image_number -1){
			state = "lightBomb"
		}
	break;
	default:
	break;
}


if(is_damage && !is_dead){
	sprite_index = spr_enemie_pig_hit;
	speed_h = 0;
}