/// @description Insert description here
// You can write your code in this editor
 speed_v += gravity_game;
 
 switch(state){
	 case "idle":
		change_sprite(spr_enemie_pig_with_bomb_idle);
		speed_h = 0;
		timer_change_state--;
		
		see_player();
		
		if(timer_change_state <= 0){
			
			state = choose("run", "idle");
			timer_change_state = time_state;
			
			if(state == "run"){
				speed_h = choose(-1, 1);
			}
		}
	 break;
	 case "run":
		change_sprite(spr_enemie_pig_bomb_run);
		timer_change_state--;
		
		see_player();
		
		if(speed_h !=0){
			image_xscale = sign(speed_h);
		}
		
		if(place_meeting(x + speed_h, y, obj_floor)){
			speed_h *= -1;
		}
		
		
		if(timer_change_state <= 0){
			state = "idle";
			timer_change_state = time_state;
		}
	 break;
	 case "pick":
		change_sprite(spr_enemie_pig_picking_bomb);
		speed_h = 0;
		if(image_index <= image_number -1){
			state = "idle"
		}
	 break;
	 case "throw":
		change_sprite(spr_enemie_pig_throw_bomb);
		speed_h = 0;
		if(image_index >= image_number -1){
			var _bomb = instance_create_layer(x, y - 14, "Weapons", obj_bomb);
			_bomb.speed_h = choose(3, 6) * image_xscale;
			_bomb.speed_v = -3;
			_bomb._stage = "on";
			
			var _new_pig = instance_create_layer(x, y, layer, obj_enemie_pig);
			_new_pig.state = "normal";
			_new_pig.is_picking_bomb = false;
			_new_pig.speed_h = 0;
			instance_destroy();
		}
	 break;
	 
	 case "hit":
		change_sprite(spr_enemie_pig_hit);
		speed_h = 0; 
		if(is_damage && !is_dead){
			sprite_index = spr_enemie_pig_hit;
			speed_h = 0;
		}
	 break;
	 
	 default:
	 break;
 }