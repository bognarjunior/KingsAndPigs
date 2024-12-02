/// @description Insert description here
// You can write your code in this editor

// Create controllers 
var _floor = place_meeting(x, y + 1, obj_floor);
var _left, _right, _jump;

_left = keyboard_check(inputs.left);
_right = keyboard_check(inputs.right);
_jump = keyboard_check_pressed(inputs.jump);

// Player Movement
speed_h = (_right - _left) * speed_moviment;

// Jump
if(_floor){
	if(_jump){
		speed_v = - jump_player;
	}
	
	// Change sprites 
	if(speed_h != 0){
		sprite_index = spr_player_run;
		
		// Change front side
		image_xscale = sign(speed_h);
	} else {
		sprite_index = spr_player_idle;
	}
} else {
	// Gravity
	speed_v += gravity_game;
	if(speed_v < 0){
		sprite_index = spr_player_jump;
	} else {
		sprite_index = spr_player_fall;
		var _enemie = instance_place(x, y + 1, obj_enemie);
		
		if(_enemie){
			if(!_enemie.is_dead){
				speed_v = - jump_player;
				_enemie.is_damage = true;
			}
		}
		
	}
	
	if(speed_h != 0){
		// Change front side
		image_xscale = sign(speed_h);
	}
}