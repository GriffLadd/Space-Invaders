/// @description Insert description here
// You can write your code in this editor
if homing and instance_exists(obj_player)
{
	var a = point_direction(x, y, obj_player.x, obj_player.y);
	direction += sign(dsin(a - direction)) * 2;
	image_angle = direction;
}

