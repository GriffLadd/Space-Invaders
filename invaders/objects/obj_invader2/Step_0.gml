/// @description Insert description here
// You can write your code in this editor
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

	// Bullet fire cooldown
	if bullet_timer < bullet_cooldown
	{
		++bullet_timer;
	}
	
	// Line of sight projectile
	if bullet_timer >= bullet_cooldown
	{
		los = instance_create_layer (x,y+16,layer,obj_los);
		los.direction = 270;
		los.speed = 50;
		los.parent = id;
		los.image_yscale = 2;
		los.image_xscale = 2;
		bullet_timer = 0;
	}

	// Enemy bullet firing
	if line_of_sight
	{
		// Create bullet
		bomb = instance_create_layer (x,y,layer,obj_bomb);
		bomb.direction = 270;
		bomb.speed = 5;
		bomb.fuse_time = 120;
		bomb.fall_dist = random_range(-100,100);
		line_of_sight = false;
		audio_play_sound(snd_shoot, 1, 0);
	}
}

if keyboard_check(ord("L"))
{
	instance_destroy();	
}

if enemy_health = 1 {image_index = 0;}
if enemy_health = 0 {image_index = 1;}
