/// @description Breaks shield

instance_create_layer(0,0,layer,obj_screenshake);
audio_play_sound(snd_shield_break, 1, 0);

// Shatters shield sprite
for (i=0; i<20;i++)
{
	my_part=instance_create_layer(x,y,"Instances",obj_particle);
	with (my_part)
	{
		sprite=obj_bossbarrier.sprite_index;
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

// Stuns boss
obj_boss.stunned = true;
obj_boss.speed = 2 * 1 / (obj_boss.stun_multiplier);
obj_boss.direction = 90;
obj_boss.alarm[3] = 180 * obj_boss.stun_multiplier;
instance_destroy();
