/// @description Insert description here
// You can write your code in this editor
if health < 1
{
	health += 0.2;
	if health > 1
	{
		health = 1;
	}
}


instance_destroy(other);
audio_play_sound(snd_pickup, 1, 0);