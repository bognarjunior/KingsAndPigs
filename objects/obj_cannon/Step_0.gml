/// @description Insert description here
// You can write your code in this editor

switch(state) {
	case "idle":
		change_sprite(spr_cannon);
	break;
	
	case "on":
		change_sprite(spr_cannon_shoot);
		
		if(image_index >= 1 && !is_cannon_ball){
			var _cannon_ball = instance_create_layer(x -10 ,y -5,layer, obj_cannon_ball);
			_cannon_ball.speed_h = -4;
			is_cannon_ball = true;
		}
		
		
		if(image_index >= image_number -1){
			state = "await";
		}
		
	break;
	
	case "await":
		change_sprite(spr_cannon);
		timer_shot_cannon--;
		
		if(timer_shot_cannon <= 0){
			timer_shot_cannon = time_shot;
			state = "idle"
		}
		
	break;
	
	default:
	break
}