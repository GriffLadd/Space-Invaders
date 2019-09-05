/// @description Spawn health drops
// You can write your code in this editor
for (i = 0; i < 12; i++)
	{
		instance_create_layer(180+random(room_width-360),125+random(500-250),layer,obj_healthdrop)
	}