/// @description Insert description here
// You can write your code in this editor

if newlevel
{
	spawn_y = 40;
	spawn_timer = 0;
	for(lines = 0; lines < 1; lines++)
	{
		x1 = 253;
		for (i=0; i<11; i++)
		{
			invader = instance_create_layer (x1,spawn_y,layer,obj_invader2);
			invader.move_timer = spawn_timer;
			x1 += 49;
		}
		spawn_y += 60;
		spawn_timer += 5;
		newlevel = false;
	}

	for(lines = 0; lines < 4; lines++)
	{
		x1 = 253;
		for (i=0; i<11; i++)
		{
			invader = instance_create_layer (x1,spawn_y,layer,obj_invader);
			invader.move_timer = spawn_timer;
			x1 += 49;
		}
		spawn_y += 60;
		spawn_timer += 5;
		newlevel = false;
	}
	boss_spawned = false;
}


if !instance_exists(obj_invader) and boss_spawned = false
{
	alarm[0] = 500;
	boss_spawned = true;
	display_text = true;
	instance_create_layer(0,0,"Instances_4",obj_roomflash)
	instance_destroy(obj_bomb);
	instance_destroy(obj_enemybullet);
	instance_destroy(obj_scrap);
	alarm[2] = 5;
	
}

if !instance_exists(obj_invader) and global.difficulty = 1 and display_text == true
{
	if not start_text {global.text_line = 0; start_text = true;}
	if not global.text_exists and global.text_line = 0
	{		
		instance_create_layer(room_width / 2,400,layer,obj_writer);
		obj_writer.text = "you're mum gay";
	}
	if not global.text_exists and global.text_line = 1
	{		
		instance_create_layer(room_width / 2,400,layer,obj_writer);
		obj_writer.text = "hahaha beans";
		obj_writer.text_speed = 10;
		obj_writer.text_decay = 120;
	}
	if global.text_line = 2
	{
		display_text = false;	
	}
}