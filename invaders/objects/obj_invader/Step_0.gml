/// @description Insert description here
// You can write your code in this editor
if !instance_exists(obj_beam)
{
	++move_timer;
	if move_timer > instance_number(obj_invader) / global.difficulty + 5 and step_count < 16
{
	x += dir * 20;	
	move_timer = 0;
	++step_count;
}

if move_timer >= 0 and step_count == 16
{
	dir = dir * -1;
	y += 60;
	step_count = 0;
	move_timer = 0;
}
}

if instance_exists(obj_player)
{
	bullet_direction = point_direction(x,y,obj_player.x,obj_player.y) + random(accuracy) - accuracy/2;
	if bullet_direction > 315
	{
		bullet_direction = 315;	
	}
		if bullet_direction < 225
	{
		bullet_direction = 225;	
	}


	// Bullet fire cooldown
	if bullet_timer < bullet_cooldown
	{
		++bullet_timer;
	}

	if bullet_timer >= bullet_cooldown
	{
		// Line of sight projectile
		los = instance_create_layer (x,y+16,layer,obj_los);
		los.direction = bullet_direction;
		los.speed = 50;
		los.image_angle = bullet_direction + 90;
		los.parent = id;
		bullet_timer = 0;
	}

	// Enemy bullet firing
	if line_of_sight
	{
		// Create bullet
		e_bullet = instance_create_layer (x,y,layer,obj_enemybullet);
		e_bullet.direction = bullet_direction;
		e_bullet.image_angle = bullet_direction + 90;
		e_bullet.speed = 6 * global.difficulty;
		e_bullet.image_xscale = 1.5;
		e_bullet.image_yscale = 1.5;
		line_of_sight = false;
		audio_play_sound(snd_shoot, 1, 0);
	}
	if obj_player.speed = 0 and accuracy > 1
	{
		accuracy -= 0.5;	
	}
	else
	{
		accuracy = 60;	
	}

}


if keyboard_check(ord("L"))
{
	instance_destroy();	
}

if enemy_health = 1 {image_index = 0;}
if enemy_health = 0 {image_index = 1;}
