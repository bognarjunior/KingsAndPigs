/// @description Insert description here
// You can write your code in this editor

// Horizontal collision
// Collision
var _collision_h = instance_place(x + speed_h, y, obj_floor);

if(_collision_h){
	
	if(speed_h > 0){
		x = _collision_h.bbox_left + (x - bbox_right);
	}
	
	if(speed_h < 0){
		x = _collision_h.bbox_right + (x - bbox_left);
	}
	
	speed_h = 0;
	
}

var _collision_y = instance_place(x, y + speed_v, obj_floor);

if(_collision_y){
	
	if(speed_v > 0){
		y = _collision_y.bbox_top + (y - bbox_bottom);
	}
	
	if(speed_v < 0){
		y = _collision_y.bbox_bottom + (y - bbox_top);
	}
	
	speed_v = 0;
	
}

// Moviments
x += speed_h

y += speed_v