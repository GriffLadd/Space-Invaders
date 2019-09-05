/// @description Insert description here
// You can write your code in this editor
old_x = 0;
old_y = 0;
ExplosionParticleSystem = part_system_create();
explosion_particle = part_type_create();
part_type_shape(explosion_particle,pt_shape_square);
part_type_scale(explosion_particle,1,1);
part_type_size(explosion_particle,0.10,0.15,-.001,0.01);
part_type_color2(explosion_particle,1980118,1988566);
part_type_alpha2(explosion_particle,1,0.75);
part_type_speed(explosion_particle,0.1,3,0,0);
part_type_direction(explosion_particle,0,359,0,0);
part_type_gravity(explosion_particle,0.05,270);
part_type_orientation(explosion_particle,0,359,10,0,true);
part_type_life(explosion_particle,50,100);
part_type_blend(explosion_particle,true);
depth = 10;

explosion_emitter = part_emitter_create(ExplosionParticleSystem);

part_emitter_region(ExplosionParticleSystem,explosion_emitter,x+10,x-10,y+10,y-10,0,0);
part_emitter_burst(ExplosionParticleSystem,explosion_emitter,explosion_particle,100);