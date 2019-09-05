/// @description Insert description here
// You can write your code in this editor
if instance_exists(obj_player)
{
	var a = point_direction(x, y, obj_player.x, obj_player.y);
	direction += sign(dsin(a - direction)) * rot_speed;
}

if speed < 7
{
	speed += 0.1;
}

if rot_speed < 10
{
	rot_speed += 0.1;	
}
