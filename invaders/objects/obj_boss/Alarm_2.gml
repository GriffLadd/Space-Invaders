/// @description Burst fire
if instance_exists(obj_player)
{
	++burst
	if bul_side == 0
	{
		e_bullet = instance_create_layer (x+lengthdir_x(43, image_angle),y + lengthdir_y(43, image_angle),"Instances",obj_enemybullet);
	}
	else
	{
		e_bullet = instance_create_layer (x - lengthdir_x(43, image_angle),y - lengthdir_y(43, image_angle),"Instances",obj_enemybullet);
	}
	bullet_direction = image_angle + random_range(-bullet_accuracy,bullet_accuracy)
	e_bullet.direction = bullet_direction - 90;
	e_bullet.image_angle = bullet_direction;
	e_bullet.speed = 7;
	e_bullet.image_xscale = 2;
	e_bullet.image_yscale = 2;
	audio_play_sound(snd_shoot, 1, 0);
	bul_side ^= 1;
	
	// Repeats this action until the correct amount of bullets have been fired
	if burst < burst_count
	{
		alarm[2] = burst_delay;
	}
	
	// Sets boss to look for new position and stop firing
	else
	{
		newpoint = true;
		firing = false;
	}
}


