/// @description Insert description here
// You can write your code in this editor
instance_destroy(other);
enemy_health -= 1;
if enemy_health == -1
{
	if irandom(2) = 2
	{
		scrap = instance_create_layer (x,y,layer,obj_scrap);
		scrap.direction = random_range(260,280);
	scrap.speed = 5;
		scrap.image_yscale = 1.5;
		scrap.image_xscale = 1.5;
	}
	score += 10;
	audio_play_sound(snd_hit, 1, 0);
	instance_destroy();	
}