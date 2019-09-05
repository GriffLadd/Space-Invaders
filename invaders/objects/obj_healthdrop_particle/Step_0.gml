/// @description Insert description here
// You can write your code in this editor
++timer
if instance_exists(parent)
{
	x = parent.x;
	y = parent.y;
 
	part_emitter_region(HealthDropParticleSystem,healthdrop_emitter,x+10,x-10,y+10,y-10,0,0);
 
	if x != old_x || old_y != y
	{
		if timer = 4
		{
		    part_emitter_burst(HealthDropParticleSystem,healthdrop_emitter,healthdrop_particle,1);
			timer = 0;
		}
	}
	 
	old_x = x;
	old_y = y;
}
else
{
	instance_destroy()	
}