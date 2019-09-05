/// @description Insert description here
// You can write your code in this editor
if instance_exists(obj_player)
{
	if string_pos("op", keyboard_string)
	{
		obj_player.fire_delay = 1;
	}

	if string_pos("po", keyboard_string)
	{
		obj_player.fire_delay = 12;
	}
}

if health <= 0
{
	restart = true;
	if (keyboard_check_pressed(vk_space))
	{
	    room_restart();
	}
}