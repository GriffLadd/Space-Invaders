/// @description Insert description here
// You can write your code in this editor
if instance_exists(obj_player)
{
	x=obj_player.x;
	y=obj_player.y - 20;
}
else
{
	instance_destroy();	
}

