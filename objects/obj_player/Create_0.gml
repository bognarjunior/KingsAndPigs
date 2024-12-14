/// @description Insert description here
// You can write your code in this editor

speed_moviment = 4;
speed_h = 0;
speed_v = 0;
gravity_game = 0.3;
jump_player = 8;

is_damage = false;

time_hit = game_get_speed(gamespeed_fps) * 1;
timer_damage = 0;

time_without_damage = game_get_speed(gamespeed_fps) * 3;
timer_invencible = 0;

state = "out"; // mormal, in, out, attack
sprite_index = spr_player_door_out;
image_speed = 0;

layer_sequence_create("Transition", x, y, seq_transition_out);

inputs = {
	left : ord("A"),
	right: ord("D"),
	jump : ord("W"),
	space : vk_space
}

on_normal_state = function(){
	var _floor = place_meeting(x, y + 1, obj_floor);
	var _left, _right, _jump, _attack;

	_left = keyboard_check(inputs.left);
	_right = keyboard_check(inputs.right);
	_jump = keyboard_check_pressed(inputs.jump);
	_attack = keyboard_check_pressed(inputs.space);

	image_speed = 1;
	
	// Player Movement
	if(timer_damage <= 0){
		speed_h = (_right - _left) * speed_moviment;
	}
	// Jump
	if(_floor){
		if(_jump){
			speed_v = - jump_player;
		}
	
		if(_attack){
			state = "attack";
		} else {
			// Change sprites 
			if(speed_h != 0){
				sprite_index = spr_player_run;
		
				// Change front side
				image_xscale = sign(speed_h);
			} else {
				sprite_index = spr_player_idle;
			}
		}
	
	} else {
		// Gravity
		speed_v += gravity_game;
		if(speed_v < 0){
			sprite_index = spr_player_jump;
		} else {
			sprite_index = spr_player_fall;
			var _enemie = instance_place(x, y + 5, obj_enemie);
		
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
	} else {
		is_damage = false;
	}

	if(timer_invencible > 0){
		timer_invencible--;
		image_alpha = 0.5;
	} else {
		image_alpha = 1;
	}


	var _enemie_hit = instance_place(x, y, obj_enemie);

	if(_enemie_hit && timer_invencible <= 0){
	
	
		if(!_enemie_hit.is_dead && !_enemie_hit.is_damage){
			is_damage = true;
			timer_damage = time_hit;
			timer_invencible = time_without_damage;
		}
	}

}