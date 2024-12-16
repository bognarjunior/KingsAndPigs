/// @description Insert description here
// You can write your code in this editor
draw_heart = function(_x, _y){
	draw_sprite_ext(spr_heart, (get_timer() / 100000), _x, _y, 2, 2, 0, c_white, 1);
}