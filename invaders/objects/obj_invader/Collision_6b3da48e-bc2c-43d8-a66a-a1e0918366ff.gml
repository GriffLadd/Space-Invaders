/// @description Insert description here
// You can write your code in this editor
for (i=0; i<5; i++)
	{
		my_part=instance_create_layer(x,y,"Instances",obj_particle);
		with (my_part)
		{
			sprite=obj_invader.sprite_index;
			left=irandom_range(0,sprite_width/1.5);
			top=irandom_range(0,sprite_height/1.5);
			width=irandom_range(5,20);
			height=irandom_range(5,10);
			spd=irandom_range(10,30);
			dir=irandom_range(0,270);
			direction=dir;
		}
	}
	score += 10;
	audio_play_sound(snd_hit, 1, 0);
	instance_create_layer(0,0,layer,obj_screenshake);
	instance_destroy();