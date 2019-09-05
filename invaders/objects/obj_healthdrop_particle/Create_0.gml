/// @description Insert description here
// You can write your code in this editor
old_x = 0;
old_y = 0;
HealthDropParticleSystem = part_system_create();
healthdrop_particle = part_type_create();
part_type_shape(healthdrop_particle,pt_shape_square);
part_type_scale(healthdrop_particle,1,1);
part_type_size(healthdrop_particle,0.1,0.15,-.001,0);
part_type_color2(healthdrop_particle,16775863,16764188);
part_type_alpha2(healthdrop_particle,1,0.75);
part_type_speed(healthdrop_particle,0.1,0.5,0,0);
part_type_direction(healthdrop_particle,0,359,0,0);
part_type_gravity(healthdrop_particle,0.02,90);
part_type_orientation(healthdrop_particle,0,359,10,0,true);
part_type_life(healthdrop_particle,25,50);
part_type_blend(healthdrop_particle,true);
depth = 10;
timer = 0;

healthdrop_emitter = part_emitter_create(HealthDropParticleSystem);
