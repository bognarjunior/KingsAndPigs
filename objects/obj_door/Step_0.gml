/// @description Insert description here
// You can write your code in this editor

switch(state){
	case "idle":
		change_sprite(spr_door_idle);
		
		var _player = instance_place(x, y, obj_player);
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
		}
	break;
	case "closing":
		change_sprite(spr_door_closing);
		
		if(image_index >= image_number -1){
			state = "idle";
		}
	break;
}