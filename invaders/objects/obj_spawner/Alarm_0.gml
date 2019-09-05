/// @description Spawn boss
// You can write your code in this editor
if boss_count == 0
{
	instance_create_layer (-90, 131,layer,obj_boss2);
}
else
{
	boss = instance_create_layer (room_width / 2, -131,layer,obj_boss);
	boss.speed = 3;
	boss.direction = 270;
}

if boss_count == 0 {boss_count = 1}
else {boss_count = 0}