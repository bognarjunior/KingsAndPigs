/// @description Insert description here
// You can write your code in this editor

// Create controllers 
var _floor = place_meeting(x, y + 1, obj_floor);
var _left, _right, _jump;

_left = keyboard_check(inputs.left);
_right = keyboard_check(inputs.right);
_jump = keyboard_check_pressed(inputs.jump);

// Player Movement
if(timer_damage <= 0){
	speed_h = (_right - _left) * speed_moviment;
}
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
			is_damage = false;
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

if(is_damage) {
	sprite_index = spr_player_hit
}

if(timer_damage > 0){
	timer_damage--;
}

var _enemie_hit = instance_place(x, y, obj_enemie);

if(_enemie_hit){
	timer_damage = time_hit;
	if(!_enemie_hit.is_dead && !_enemie_hit.is_damage){
		is_damage = true;
	}
}