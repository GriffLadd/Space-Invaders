/// @description Insert description here
// You can write your code in this editor
homing = true;
direction = 180;
alarm[0] = 100;
trail = instance_create_layer (x,y,layer,obj_homing_particle);
trail.parent = id;
depth = 10;