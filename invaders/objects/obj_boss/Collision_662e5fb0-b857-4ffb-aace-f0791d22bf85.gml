/// @description Stuns boss

if not stunned
{
	stunned = true;
	speed = 3;
	direction = 90;
	alarm[3] = 60;
	audio_play_sound(snd_boss_impact, 1, 0);
	instance_create_layer(0,0,layer,obj_screenshake);
}