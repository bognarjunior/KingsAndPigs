/// @description Insert description here
// You can write your code in this editor
draw_text(20,20,global.life_player);

var _x = 20;
var _y = 60;
var _marg = 30;

// Repeat for draw heart
repeat(global.life_player){
	draw_heart(_x, _y);
	_x += _marg;
}
