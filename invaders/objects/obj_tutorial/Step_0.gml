/// @description Insert description here
// You can write your code in this editor
if not start_text {global.text_line = 0; start_text = true;}
if not global.text_exists and global.text_line == 0
{
	instance_create_layer(room_width / 2,400,layer,obj_writer);
	obj_writer.text = "Hello.";
	obj_writer.text_speed = 2;
}

	
if not global.text_exists and global.text_line == 1
{
	instance_create_layer(room_width / 2,400,layer,obj_writer);
	obj_writer.text = "This simulation will teach you how to fend off slow-moving aliens.";
	obj_writer.text_speed = 2;
}

if not global.text_exists and global.text_line == 2
{
	instance_create_layer(room_width / 2,400,layer,obj_writer);
	obj_writer.text = "Use WASD to move your ship.";
	obj_writer.text_speed = 2;
	obj_writer.text_decay = -1;
}

if global.text_finished == true and global.text_line == 2
{
	movement_prompt = true;
}

if movement_prompt
{
	if keyboard_check(ord("D")) or keyboard_check(ord("A")) or keyboard_check(ord("W")) or keyboard_check(ord("S"))
	{
		global.text_exists = false;
		global.text_line += 2;
		instance_destroy(obj_writer);
		movement_prompt = false;
	}
}

if not global.text_exists and global.text_line == 4
{
	instance_create_layer(room_width / 2,400,layer,obj_writer);
	obj_writer.text = "Hold SPACE to fire your cannon.";
	obj_writer.text_speed = 2;
	obj_writer.text_decay = -1;
}

if global.text_finished == true and global.text_line == 4
{
	shoot_prompt = true;
}

if shoot_prompt
{
	if keyboard_check(vk_space)
	{
		global.text_exists = false;
		global.text_line += 1;
		instance_destroy(obj_writer);
		shoot_prompt = false;
		next_step = false;
		alarm[0] = 30;
	}
}

if global.text_exists == false and global.text_line == 5 and next_step and enemy_prompt == false
{
	instance_create_layer(room_width / 2,400,layer,obj_writer);
	obj_writer.text = "Destroy the invader!";
	obj_writer.text_speed = 2;
	obj_writer.text_decay = -1;
	invader = instance_create_layer(room_width / 2,200,layer,obj_invader);
	invader.column_num = 1;
	enemy_prompt = true;
}

if enemy_prompt
{
	if !instance_exists(obj_invader)
	{
		global.text_exists = false;
		global.text_line += 1;
		instance_destroy(obj_writer);
		enemy_prompt = false;
		next_step = false;
	}
}

if not global.text_exists and global.text_line == 6
{
	instance_create_layer(room_width / 2,400,layer,obj_writer);
	obj_writer.text = "Destroy invader drops to gain health.";
	obj_writer.text_speed = 2;	
	obj_writer.text_decay = -1;
}

if global.text_line == 6 and global.text_finished and !instance_exists(obj_scrap)
{
	obj_writer.alarm[0] = 60;
	global.text_finished = false;
}

if not global.text_exists and global.text_line == 7
{
	instance_create_layer(room_width / 2,400,layer,obj_writer);
	obj_writer.text = "Your ship also has a shield. Press ENTER to use it.";
	obj_writer.text_speed = 2;
	obj_writer.text_decay = -1;
}

if global.text_finished == true and global.text_line == 7
{
	shield_prompt = true;
}

if shield_prompt
{
	if keyboard_check(vk_enter)
	{
		global.text_exists = false;
		global.text_line += 1;
		instance_destroy(obj_writer);
		shield_prompt = false;
		next_step = false;
		alarm[0] = 30;
	}
}

if not global.text_exists and global.text_line == 8
{
	instance_create_layer(room_width / 2,400,layer,obj_writer);
	obj_writer.text = "Your shield can absorb small projectiles and block charging enemies.";
	obj_writer.text_speed = 2;
}

if not global.text_exists and global.text_line == 9
{
	instance_create_layer(room_width / 2,400,layer,obj_writer);
	obj_writer.text = "Absorb these projectiles to build energy.";
	obj_writer.text_speed = 2;
	obj_writer.text_decay = -1;
}

if global.text_finished and global.text_line == 9 and not set_alarm
{
	alarm[1] = 60;	
	set_alarm = true;
}

if global.text_line == 9 and global.beam_energy = 1
{
	instance_destroy(obj_writer);
	global.text_line += 1;
	instance_create_layer(room_width / 2,400,layer,obj_writer);
	obj_writer.text = "Once your energy is full, press Q to use your ultimate.";
	obj_writer.text_speed = 2;
	obj_writer.text_decay = -1;
	ultimate_prompt = true;
}

if ultimate_prompt and keyboard_check(ord("Q"))
{
	ultimate_prompt = false;
	instance_destroy(obj_writer);
	next_step = false;
	alarm[0] = 60;
	global.text_line += 1;
}

if global.text_line == 11 and next_step
{
	instance_create_layer(room_width / 2,400,layer,obj_writer);
	obj_writer.text = "Simulation complete. Press F to continue.";
	obj_writer.text_speed = 2;
	obj_writer.text_decay = -1;
	++global.text_line;
}

if keyboard_check(ord("F"))
{
	room_goto(1);
}

