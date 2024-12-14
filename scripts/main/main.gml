// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function main(){

}

global.is_transition = true;

randomize();

function change_sprite(_sprite) {
	image_speed = 1;
	if(sprite_index != _sprite){
		sprite_index = _sprite;	
		image_index = 0;
	}
}