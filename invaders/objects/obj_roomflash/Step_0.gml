/// @description Insert description here
// You can write your code in this editor
if not decay
{
	image_alpha += 0.2;
	if image_alpha == 1
	{
		alarm[0] = 2;
	}
}
else
{
	image_alpha -= 0.05;
	if image_alpha = 0
	{
		instance_destroy();	
	}
}