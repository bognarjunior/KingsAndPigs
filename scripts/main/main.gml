// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function main(){

}

global.is_transition = true;
global.max_life_player = 3;
global.life_player = global.max_life_player;

instance_create_depth(0,0,0,obj_controller);

randomize();

function change_sprite(_sprite) {
	image_speed = 1;
	if(sprite_index != _sprite){
		sprite_index = _sprite;	
		image_index = 0;
	}
}