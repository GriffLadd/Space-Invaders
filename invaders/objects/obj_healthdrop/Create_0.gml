/// @description Insert description here
// You can write your code in this editor
direction = random(359);
image_xscale = 2;
image_yscale = 2;
trail = instance_create_layer (x,y,layer,obj_healthdrop_particle);
trail.parent = id;
rot_speed = 0;