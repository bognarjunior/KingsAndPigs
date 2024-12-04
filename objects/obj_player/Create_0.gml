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

inputs = {
	left : ord("A"),
	right: ord("D"),
	jump : ord("W"),
	space : vk_space
}