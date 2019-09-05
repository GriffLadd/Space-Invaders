if obj_player.vulnerable
{
	health -= argument0;
	obj_player.alarm[1] = 60;
	obj_player.vulnerable = false;
	audio_play_sound(snd_hit, 1, 0);
	instance_create_layer(0,0,layer,obj_screenshake);
}