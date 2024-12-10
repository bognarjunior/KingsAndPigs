/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

is_damage = false;
is_dead = false;

change_sprite = function(_sprite) {
	if(sprite_index != _sprite){
		sprite_index = _sprite;	
		image_index = 0;
	}
}
