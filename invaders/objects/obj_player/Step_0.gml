
// Directional movement
var x_dir = keyboard_check(ord("D")) - keyboard_check(ord("A"));
var y_dir = keyboard_check(ord("S")) - keyboard_check(ord("W"));
x += x_dir * player_speed;
y += y_dir * player_speed;

// Constrain player to bottom of screen and inside screen
y = clamp(y, 532, room_height - 32);
x = clamp(x, 32, room_width - 32);

// Bullet firing
if (keyboard_check(vk_space) and !instance_exists(obj_barrier) and can_fire)
{
	// Create bullet
	p_bullet = instance_create_layer (x,y,layer,obj_bullet);
	p_bullet.direction = 90;
	p_bullet.speed = bullet_speed;
	can_fire = false;
	alarm[0] = fire_delay;
	audio_play_sound(snd_shoot, 1, 0);
}

// Barrier projection
if (keyboard_check_pressed(vk_enter) and shield_usable)
{
	// Create barrier
	barrier = instance_create_layer (x,y-20,layer,obj_barrier);
	barrier.image_speed = 2;
	shield_usable = false;
	global.shield_cd = 0;
}

//Sprite Explosion
if (health <= 0)
{
	health = 0;
	for (i=0; i<15;i++)
	{
		my_part=instance_create_layer(x,y,"Instances",obj_particle);
		with (my_part)
		{
			sprite=obj_player.sprite_index;
			left=irandom_range(0,sprite_width/1.5);
			top=irandom_range(0,sprite_height/1.5);
			width=irandom_range(5,20);
			height=irandom_range(5,20);
			spd=irandom_range(10,30);
			dir=irandom_range(0,270)
			direction=dir;
		}
	}
	audio_stop_all();
	instance_destroy();
}

//Death beam
if (keyboard_check_pressed(ord("Q")) and global.beam_energy == 1)
{
	beam = instance_create_layer (x,y,layer,obj_beam);
	beam.direction = 90;
	beam.speed = 50;
	global.beam_energy = 0;
}

//if (keyboard_check_pressed(ord("Q")) and global.beam_energy == 1)
//{
//	room_speed /= 2;
//	player_speed *= 2;
//	bullet_speed *= 2;
//	fire_delay = fire_delay / 2;
//	
//}

if global.shield_cd < 60 and !instance_exists(obj_barrier)
{
	++global.shield_cd
}

if global.shield_cd == 60
{
	shield_usable = true;
}


//Invulnerability timer
if !vulnerable
{
	image_speed = 2;
}
else
{
	image_index = 0;
	image_speed = 0;
}