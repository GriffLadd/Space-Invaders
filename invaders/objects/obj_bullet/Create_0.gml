/// @description Insert description here
// You can write your code in this editor
BulletParticleSystem = part_system_create();
bullet_particle = part_type_create();
part_type_shape(bullet_particle,pt_shape_square);
part_type_scale(bullet_particle,0.5,0.5);
part_type_size(bullet_particle,0.10,0.15,-.001,0);
part_type_color2(bullet_particle,16765535,16775657);
part_type_alpha2(bullet_particle,1,0.25);
part_type_speed(bullet_particle,2,4,0,0);
part_type_direction(bullet_particle,60,120,0,0);
part_type_gravity(bullet_particle,0.02,270);
part_type_orientation(bullet_particle,0,359,10,0,true);
part_type_life(bullet_particle,20,40);
part_type_blend(bullet_particle,true);
bullet_emitter = part_emitter_create(BulletParticleSystem);

part_emitter_region(BulletParticleSystem,bullet_emitter,x,x,y,y,0,0);
part_emitter_burst(BulletParticleSystem,bullet_emitter,bullet_particle,irandom_range(5,10));