// Fades in shield
if global.boss_started or bullet_collision
{
	if not sound_played
	{
		audio_play_sound(snd_shield_create, 1, 0);
		sound_played = true;
	}
	if image_alpha < 1
	{
		image_alpha += 0.05;
	}
}


