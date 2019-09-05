/// @description Insert description here
// You can write your code in this editor

if current_attack == 1 and not stunned and new_attack == 0
{
	if newpoint
	{
		if not dir_chosen {bomb_dir = irandom(1); dir_chosen = true;}
		if bomb_dir = 1
		{
			moveto_x = 90;
		}
		if bomb_dir = 0
		{
			moveto_x = room_width - 90;
		}
		move_towards_point(moveto_x, 131,movement_speed);
			
		if point_distance(x,y,moveto_x,131) < 10
		{
			newpoint = false;
		}
	}
	if not firing and not newpoint
	{
		i = 0;
		bomb_gap = irandom_range(1,7);
		firing = true;
		nextpoint_x = room_width / 14;
		bomb_sweeps = 0;
		if not second_phase {sweep_completed = true;}
	}

	if x > nextpoint_x and i < 7 and firing and bomb_dir == 1
	{
		speed = 15;
		direction = 0;
		if ((nextpoint_x + room_width/14) / (room_width / 7)) != bomb_gap
		{
			bomb = instance_create_layer (x,y,"Instances_1",obj_bomb);
			bomb.direction = 270;
			bomb.speed = 5;
			bomb.fuse_time = 200;
			bomb.fall_dist = 0;
			line_of_sight = false;
			audio_play_sound(snd_shoot, 1, 0);
		}
		++i;
		nextpoint_x += room_width / 7;
	}
		
	if x < room_width - nextpoint_x and i < 7 and firing and bomb_dir == 0
	{
		speed = 15;
		direction = 180;
		if ((nextpoint_x + room_width/14) / (room_width / 7)) != bomb_gap
		{
			bomb = instance_create_layer (x,y,"Instances_1",obj_bomb);
			bomb.direction = 270;
			bomb.speed = 5;
			bomb.fuse_time = 200;
			bomb.fall_dist = 0;
			line_of_sight = false;
			audio_play_sound(snd_shoot, 1, 0);
		}
		++i;
		nextpoint_x += room_width / 7;
	}

	if i >= 7 and second_phase and not sweep_completed
	{
		if not swapped
		{
			bomb_dir ^= 1;
			swapped = true;
			newpoint = true;
			old_bomb_gap = bomb_gap;
		}

		if bomb_dir = 0 and newpoint
		{
			move_towards_point(room_width - room_width/14 - 10, 131,1);
			if point_distance(x,y,moveto_x,131) < 10
			{
				newpoint = false;
			}
		}
		if bomb_dir = 1 and newpoint
		{
			move_towards_point(room_width + room_width/14 + 10, 131,1);
			if point_distance(x,y,moveto_x,131) < 10
			{
				newpoint = false;
			}
		}
		if not newpoint
		{
			i = 0;
			speed = 0;
			stunned = true;
			nextpoint_x = room_width / 14;
			++bomb_sweeps
			bomb_gap = irandom_range(1,7);
			alarm[3] = 150 * (2 / (abs(bomb_gap - old_bomb_gap) + 2));
			if bomb_sweeps == 1
			{
				sweep_completed = true;
				bomb_sweeps = 0;
			}
		}	
	}


	if i >= 7 and sweep_completed
	{
		firing = false;
		newpoint = true;
		new_attack = 1;
		i = 0;
		swapped = false;
		bomb_dir = 0;
		dir_chosen = false;
		sweep_completed = false;
		stunned = true;
		alarm[3] = 60;
		speed = 3;
		direction += 180;
	}	
}
if current_attack == 2 and not stunned and new_attack == 0
{
	if newpoint
	{
		move_towards_point(room_width / 2, 250,movement_speed);
		if point_distance(x,y,room_width/2,250) < 10
		{
			blaster_rand = irandom(1);
			newpoint = false;
			speed = 0;
			i = 0;
		}
	}
	if not newpoint and instance_number(obj_bomb) < 6
	{
		if blaster_rand == 1
		{
			targ_x = 10;
			for (countx = 0; countx < 12; ++countx)
			{
				blaster = instance_create_layer (x,y,"Instances",obj_blaster);
				blaster.target_point_x = targ_x;
				blaster.target_point_y = 94;
				targ_x += 100;
			}
			if second_phase {blaster_rand = 0; ++i}
			else {i = 2}
		}

		if blaster_rand == 0
		{
			targ_y = room_width - 10;
			for (county = 0; county < 9; ++county)
			{
				blaster = instance_create_layer (x,y,"Instances",obj_blaster);
				blaster.target_point_x = 110;
				blaster.target_point_y = targ_y;
				targ_y -= 100;
			}
			if second_phase {blaster_rand = 1; ++i}
			else {i = 2}
		}

		if i >= 2
		{
			new_attack = 1;
			newpoint = true;
			stunned = true;
			alarm[3] = 120;
		}

	}
}
if current_attack == 3 and not stunned and new_attack == 0
{
			
	// Moves boss to random position on the screen
	if newpoint
	{
		while distance_to_point(moveto_x, moveto_y) < 100
		{
			moveto_x = 250+random(room_width-500);
			moveto_y = irandom_range(150,300);
		}
		newpoint = false;
	}
	move_towards_point(moveto_x, moveto_y,movement_speed);

	// Starts firing sequence
	if distance_to_point(moveto_x, moveto_y) < 10
	{	
		speed = 0;
		if not firing
		{
			firing = true;
			burst = 0;
			alarm[2] = burst_delay;
		}
			
		if fired
		{
			new_attack = 1;
			firing = false;
			newpoint = true;
			speed = 0;
			fired = false;
			burst = 0;
		}
	}

}
	
// Initiates second phase of the boss
if global.boss_health <= 25 and not second_phase
{
	for (i=0; i<10;i++)
	{
		my_part=instance_create_layer(x,y,"Instances",obj_particle);
		with (my_part)
		{
			sprite=obj_boss.sprite_index;
			left=irandom_range(0,sprite_width);
			top=irandom_range(0,sprite_height);
			width=irandom_range(30,100);
			height=irandom_range(30,100);
			spd=irandom_range(10,30);
			dir=irandom_range(0,270)
			direction=dir;
			image_angle=dir;
		}
	}
	
	new_attack = 1;
	sprite_index = spr_boss2_phase2;
	stunned = true;
	alarm[3] = 30
	burst_count = 10;
	instance_create_layer(0,0,"Instances_1",obj_screenshake);
	speed = 0;
	second_phase = true;
	firing = false;
	newpoint = true;
	alarm[2] = -1;
	fired = false;
	burst = 16;
	i = 0;
	swapped = false;
	bomb_dir = 0;
	dir_chosen = false;
	sweep_completed = false;
	swapped = false;
	sweep_completed = false;
	bullet_speed = 6;
	current_attack = 0;
	for (i = 0; i < 6; ++i)
	{
		instance_create_layer(x,y,"Instances",obj_healthdrop)	
	}
	smoke = instance_create_layer(x,y,"Instances",obj_smoke_particle);
	smoke.parent = id;
	explosion = instance_create_layer(x,y,"Instances",obj_explosion_particle);
	explosion.parent = id
}
	
if new_attack == 1
{
	old_attack = current_attack;
	while current_attack == old_attack
	{
		current_attack = irandom_range(1,3);
	}
	new_attack = 0;
}

// When boss dies
if global.boss_health <= 0
{
	for (i=0; i<10;i++)
	{
		my_part=instance_create_layer(x,y,"Instances",obj_particle);
		with (my_part)
		{
			sprite=spr_boss2_phase2;
			left=irandom_range(0,sprite_width);
			top=irandom_range(0,sprite_height);
			width=irandom_range(30,100);
			height=irandom_range(30,100);
			spd=irandom_range(10,30);
			dir=irandom_range(0,270)
			direction=dir;
			image_angle=dir;
		}
	}
	obj_spawner.alarm[1] = 180;
	global.boss_started = false;
	score += 500;
	
	instance_create_layer(0,0,"Instances_4",obj_roomflash)
	instance_destroy(obj_bomb);
	instance_destroy(obj_enemybullet);
	instance_destroy(obj_blaster);
	instance_destroy(obj_scrap);
	instance_destroy(obj_homing_ball);
	audio_play_sound(snd_explosion, 1, 0);
	audio_stop_sound(snd_boss);
	
	for (i = 0; i < 12; ++i)
	{
		instance_create_layer(x,y,"Instances_1",obj_healthdrop)	
	}
	instance_destroy();	
}
