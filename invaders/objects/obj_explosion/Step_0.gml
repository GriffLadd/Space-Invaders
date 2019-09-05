/// @description Insert description here
// You can write your code in this editor
if expl_growth > 0
{
	expl_growth -= 0.5;
}

image_xscale += expl_growth;
image_yscale += expl_growth;

if expl_growth == 0
{
	image_alpha -= 0.1;
}

if image_alpha == 0
{
	instance_destroy();	
}
