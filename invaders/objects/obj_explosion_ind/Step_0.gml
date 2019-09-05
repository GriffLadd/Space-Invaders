/// @description Insert description here
// You can write your code in this editor
if instance_exists(parent)
{
	if not fuse_set
	{
		alarm[0] = parent.fuse_time;	
		fuse_set = true;
	}

	x = parent.x;
	y = parent.y;

	if image_xscale < 8
	{
		image_xscale += 0.1;
		image_yscale += 0.1;
	}
}
else
{
	instance_destroy()	
}

