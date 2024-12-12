// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function main(){

}

randomize();

function change_sprite(_sprite) {
	if(sprite_index != _sprite){
		sprite_index = _sprite;	
		image_index = 0;
	}
}