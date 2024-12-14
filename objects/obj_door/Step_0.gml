/// @description Insert description here
// You can write your code in this editor

var _player = instance_place(x, y, obj_player);

if(global.is_transition){
	exit;
}

switch(state){
	case "idle":
		change_sprite(spr_door_idle);
		image_speed = 1;
		
		if(_player){
			if(keyboard_check_pressed(ord("S"))){
				state = "opening";
				
				_player.state = "in";
			}
		}
		
	break;
	case "opening":
		change_sprite(spr_door_opening);
		
		if(image_index >= image_number -1){
			image_speed = 0;
			layer_sequence_create("Transition", _player.x, _player.y, seq_transition_in);
		}
	break;
	case "closing":
		change_sprite(spr_door_closing);
		
		if(image_index >= image_number -1){
			state = "idle";
		}
	break;
}