/// @description Insert description here
// You can write your code in this editor
if instance_exists(parent)
{
	x = parent.x;
	y = parent.y;
 
	part_emitter_region(HomingParticleSystem,homing_emitter,x+10,x-10,y+10,y-10,0,0);
 
	if x != old_x || old_y != y
	{
	    part_emitter_burst(HomingParticleSystem,homing_emitter,homing_particle,2);
	}
	 
	old_x = x;
	old_y = y;
}
else
{
	instance_destroy()	
}