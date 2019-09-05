/// @description Insert description here
// You can write your code in this editor
if not fired
{
	direction = point_direction(x, y, target_point_x, target_point_y);

	if point_distance(x,y,target_point_x,target_point_y) < 10 < 100 and speed > 0
	{
		if not decel_calculated
		{
			decel = 15 * 15 / point_distance(x,y,target_point_x,target_point_y) / 2;
			decel_calculated = true;
		}
	
		speed -= decel;	
	
		if speed < 0
		{
			speed = 0;	
		}
	
	}

	if speed == 0
	{
		if not alarm_activated
		{
			audio_play_sound(snd_shield_create,1,0);
			speed = 0;
			alarm[0] = 100;
			alarm_activated = true;
			instance_create_layer(x,y,"Instances_1",obj_blast_ind_x);
			ind = instance_create_layer(x,y,"Instances_1",obj_blast_ind_x);
			ind.image_angle = 90;
		}
	}
}


if fired 
{
	speed += 1;
}