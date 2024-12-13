/// @description Insert description here
// You can write your code in this editor

// Create controllers 
var _img_speed  = sprite_get_speed(sprite_index) / game_get_speed(gamespeed_fps);
switch(state){
	case "normal":
		on_normal_state();
	break;
	
	case "in":
		change_sprite(spr_player_door_in);
		
		if(image_index >= image_number - _img_speed){
			image_speed = 0;
			image_index = image_number -1;
			image_alpha = 0;
			//instance_destroy();
		}
	break;
	
	case "out":
		change_sprite(spr_player_door_out);
		
		if(image_index >= image_number - _img_speed){
			state = "normal";
		}
	break;
	
	case "attack":
		change_sprite(spr_player_attack);
	
		if(image_index >= image_number - _img_speed){
			state = "normal";
		}
	break;
}
