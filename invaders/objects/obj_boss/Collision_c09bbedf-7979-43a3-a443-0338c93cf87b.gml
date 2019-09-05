/// @description Damages boss
if !instance_exists(obj_bossbarrier)
{
	global.boss_health -= 1;
	image_index = 1;
	alarm[1] = 5;
	audio_play_sound(snd_hit, 1, 0);
	instance_destroy(other)
}