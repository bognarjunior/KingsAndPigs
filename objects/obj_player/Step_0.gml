/// @description Insert description here
// You can write your code in this editor

// Create controllers 
var _floor = place_meeting(x, y + 1, obj_floor);
var _left, _right, _jump;

_left = keyboard_check(inputs.left);
_right = keyboard_check(inputs.right);
_jump = keyboard_check_pressed(inputs.jump);

// Player Movement
speed_player_h = (_right - _left) * speed_player;

// Jump
if(_floor){
	if(_jump){
		speed_player_v = - jump_player;
	}
	
	// Change sprites 
	if(speed_player_h != 0){
		sprite_index = spr_player_run;
		
		// Change front side
		image_xscale = sign(speed_player_h);
	} else {
		sprite_index = spr_player_idle;
	}
} else {
	// Gravity
	speed_player_v += gravity_player;
	if(speed_player_v < 0){
		sprite_index = spr_player_jump;
	} else {
		sprite_index = spr_player_fall;
	}
	
	if(speed_player_h != 0){
		// Change front side
		image_xscale = sign(speed_player_h);
	}
}