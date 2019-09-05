/// @description Insert description here
// You can write your code in this editor
// Follows boss
if instance_exists(obj_boss)
{
	x=obj_boss.x;
	y=obj_boss.y;
}

else

 // Destroys shield if boss disappears
{
	instance_destroy();	
}