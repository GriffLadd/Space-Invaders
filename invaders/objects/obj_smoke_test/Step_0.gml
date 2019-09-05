/// @description Insert description here
// You can write your code in this editor
if (keyboard_check(vk_space))
{
	particle = instance_create_layer(x,y,"Instances_1",obj_explosion_particle)
	particle.parent = id;
	
}