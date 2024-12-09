/// @description Insert description here
// You can write your code in this editor
speed_v += gravity_game

if(place_meeting(x , y + 1, obj_floor)) {
	if(speed_h != 0){
		speed_h *= 0.9;
	}
	
	timer_transform--;
	
} else {
	speed_h *= 0.99;
}

if(abs(speed_h) <= 0.1 && timer_transform <=0){
	instance_create_layer(x, y + sprite_height/2, layer, obj_bomb);
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
		_bomb._stage = "on"
	}
}
