// Stops the boss from moving too far before fight starts
if y > 266 and not global.boss_started
{
	speed = 0;	
}

// Boss pattern starts
if instance_exists(obj_player)
{
	if global.boss_started
	{
		if not stunned
		{
			// Burst laser attack
			if current_attack = "laser"
			{
				if y < 600
				{
					var pd = point_direction(x, y, obj_player.x, obj_player.y) + 90;
					var dd = angle_difference(image_angle, pd);
					image_angle -= min(abs(dd), 2) * sign(dd);
				}
			
				// Moves boss to random position on the screen
				if newpoint
				{
					while distance_to_point(moveto_x, moveto_y) < 100
					{
					moveto_x = 180+random(room_width-360);
					moveto_y = 125+random(500-250);
					}
					newpoint = false;
				}
				direction = point_direction(x,y,moveto_x, moveto_y);
				speed=min(movement_speed,0.1*point_distance(x,y,moveto_x, moveto_y))
			
				// Leaves trail behind boss if in second phase
				if second_phase
				{
					instance_create_layer (x,y,"Instances",obj_boss_trail)	
				}
				// Starts firing sequence
				if point_distance(x,y,moveto_x, moveto_y) < 10
				{	
					speed = 0;
					while not firing
					{
						alarm[2] = burst_delay;
						firing = true;
						burst = 0;
						++attacks;
					
						// If 4 attacks have been made switch to slam attack
						if attacks > 4
						{
							current_attack = "slam";	
							attacks = 0;
							slam_passed = false;
						}
					}

				}
			}
			// Slam attack
			if current_attack = "slam" and not firing
			{
				// Boss follows above player position until met
				if not slam_passed
					slam_posx = obj_player.x;
					slam_posy = 150;
					direction = point_direction(x,y,slam_posx,150);
					speed = movement_speed/2;
					var pd = point_direction(x, y, obj_player.x, obj_player.y) + 90;
					var dd = angle_difference(image_angle, pd);
					image_angle -= min(abs(dd), 2) * sign(dd);
				
				// Boss slams down on player position
				if distance_to_point(slam_posx, slam_posy) < 10 or slam_passed
				{
					// Leaves trail behind boss
					instance_create_layer (x,y,"Instances",obj_boss_trail);
				
					slam_passed = true;
					image_angle = 0;
					speed = slam_speed;
					direction = 270;
					if instance_exists(obj_bossbarrier)
					{
					required_height = room_height-126;
					}
					else
					{
						required_height = room_height-66;	
					}
				
					// After slam is completed
					if y > required_height
					{
						audio_play_sound(snd_boss_impact, 1, 0);
						instance_create_layer(0,0,"Instances",obj_screenshake);
					
						// Stops the boss on the ground after slam
						speed = 0;	
						stunned = true;
						alarm[3] = 20;
					
						// Switch back to laser attack
						current_attack = "laser";	
						slam_passed = false;
					}
				}
			}
		}
	}

	// Initiates second phase of the boss
	if global.boss_health <= 25 and not second_phase and y <= 407
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
		sprite_index = spr_boss_phase2;
		instance_create_layer(0,0,"Instances",obj_screenshake);
		instance_create_layer (x,y,"Instances",obj_bossbarrier);
		speed = 0;
		stunned = true;
		alarm[3] = 30
		movement_speed *= 1.5;
		slam_speed *= 1.2;
		bullet_speed *= 1.5;
		burst_count = 10;
		bullet_accuracy *= 1.5;
		second_phase = true;
		stun_multiplier = 0.5;
		for (i = 0; i < 6; ++i)
		{
			instance_create_layer(x,y,"Instances",obj_healthdrop)	
		}
		smoke = instance_create_layer(x,y,"Instances",obj_smoke_particle);
		smoke.parent = id;
		explosion = instance_create_layer(x,y,"Instances",obj_explosion_particle);
		explosion.parent = id
	}

	// When boss dies
	if global.boss_health <= 0
	{
		for (i=0; i<10;i++)
		{
			my_part=instance_create_layer(x,y,"Instances",obj_particle);
			with (my_part)
			{
				sprite=spr_boss_phase2;
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
	
		attacks = 0;
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
			instance_create_layer(x,y,"Instances",obj_healthdrop)	
		}
		instance_destroy();	
	}
}
