/// @description Insert description here
// You can write your code in this editor
instance_create_layer(0,0,layer,obj_screenshake);
instance_create_layer(x,y,layer,obj_blast_laser_x);
laser = instance_create_layer(x,y,layer,obj_blast_laser_x);
laser.image_angle = 90;
alarm[1] = 60;