/// @description Insert description here
// You can write your code in this editor

switch(state) {
	case "idle":
		change_sprite(spr_cannon);
	break;
	
	case "on":
		change_sprite(spr_cannon_shoot);
		
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