/// @description Insert description here
// You can write your code in this editor
if y > 500 + fall_dist
{
	if speed >= 0
	{
		speed -= 0.1;
	}
	image_speed += 0.01
	if not alarm_activated
	{
		expl_ind = instance_create_layer(x,y,layer,obj_explosion_ind);
		expl_ind.parent = id;
		alarm[0] = fuse_time;
		alarm_activated = true;
	}
}
