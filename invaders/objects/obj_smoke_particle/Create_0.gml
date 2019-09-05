/// @description Insert description here
// You can write your code in this editor
SmokeParticleSystem = part_system_create();
smoke_particle = part_type_create();
part_type_shape(smoke_particle,pt_shape_smoke);
part_type_scale(smoke_particle,1,1);
part_type_size(smoke_particle,0.10,0.15,0.03,0);
part_type_color2(smoke_particle,13553358,4671303);
part_type_alpha2(smoke_particle,1,0);
part_type_speed(smoke_particle,0.1,0.2,0,0);
part_type_direction(smoke_particle,90,0,0,0);
part_type_gravity(smoke_particle,0.02,90);
part_type_orientation(smoke_particle,0,359,0,0,true);
part_type_life(smoke_particle,100,150);
part_type_blend(smoke_particle,true);
depth = 10;

smoke_emitter = part_emitter_create(SmokeParticleSystem);

alarm[1] = 15;