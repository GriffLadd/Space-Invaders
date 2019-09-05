/// @description Insert description here
// You can write your code in this editor
old_x = 0;
old_y = 0;
HomingParticleSystem = part_system_create();
homing_particle = part_type_create();
part_type_shape(homing_particle,pt_shape_square);
part_type_scale(homing_particle,1,1);
part_type_size(homing_particle,0.10,0.15,-.001,0);
part_type_color2(homing_particle,1980118,1988566);
part_type_alpha2(homing_particle,1,0.75);
part_type_speed(homing_particle,0.1,0.5,0,0);
part_type_direction(homing_particle,0,359,0,0);
part_type_gravity(homing_particle,0.02,90);
part_type_orientation(homing_particle,0,359,10,0,true);
part_type_life(homing_particle,100,150);
part_type_blend(homing_particle,true);
depth = 10;

homing_emitter = part_emitter_create(HomingParticleSystem);

alarm[0] = 100;