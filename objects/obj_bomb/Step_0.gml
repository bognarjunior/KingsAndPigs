/// @description Insert description here
// You can write your code in this editor

speed_v += gravity_game;

if(place_meeting(x , y + 1, obj_floor)) {
	if(speed_h != 0){
		speed_h *= 0.9;
	}
} else {
	speed_h *= 0.99;
}

switch(_stage) {
	case "off":
		sprite_index = spr_bomb_off;
    break;

    case "on":
		sprite_index = spr_bomb_on;
		if(timer_boom > 0) {
			timer_boom --;
		} else {
			_stage = "boom";
		}
    break;

    case "boom":
	
		if(sprite_index != spr_bomb_boom){
			sprite_index = spr_bomb_boom;
			image_index = 0;
		}
		
		if(image_index >= image_number -1){
			instance_destroy();
		}
		
		var _player = instance_place(x, y, obj_player);
		
		if(_player){
			with(_player){
				is_damage = true;
				timer_damage = time_hit;
				timer_invencible = time_without_damage;
			}
		}
		
		var _bomb = instance_place(x, y, obj_bomb);
			
		if(_bomb){
			if(_bomb._stage == "off"){
				_bomb.timer_boom = game_get_speed(gamespeed_fps);
				_bomb._stage = "on";
			}
		}
		
    break;

    default:
		sprite_index = spr_bomb_off;
    break;
}