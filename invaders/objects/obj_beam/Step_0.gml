/// @description Bullet timing and fade out

++timer;
if (y < 0)
{
	speed = 0;
	if image_alpha > 0 and timer > 80
	{
		image_alpha-=0.01;
	}
	if image_alpha == 0
	{
		instance_destroy();
	}
}