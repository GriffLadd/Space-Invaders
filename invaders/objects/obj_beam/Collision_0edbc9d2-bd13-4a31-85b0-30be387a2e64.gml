/// @description Insert description here
// You can write your code in this editor
if not boss_collision
{
	global.boss_health -= 10;
	boss_collision = true;
	obj_boss.image_index = 1;
	obj_boss.alarm[1] = 5;
	instance_create_layer(0,0,layer,obj_screenshake);
}
