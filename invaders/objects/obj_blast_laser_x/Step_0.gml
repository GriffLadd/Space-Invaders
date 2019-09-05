/// @description Insert description here
// You can write your code in this editor
image_xscale += 5;
if image_xscale > 64 and not alarm_activated
{
	alarm[0] = 30;
	alarm_activated = true;
}

if decay
{
	image_alpha -= 0.05;	
}

if image_alpha == 0
{
	instance_destroy();	
}
