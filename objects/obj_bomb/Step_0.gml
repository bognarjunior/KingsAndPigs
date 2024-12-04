/// @description Insert description here
// You can write your code in this editor

speed_v += gravity_game;

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
		}
    break;

    default:
		sprite_index = spr_bomb_off;
    break;
}