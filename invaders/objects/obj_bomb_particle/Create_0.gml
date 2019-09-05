/// @description Insert description here
// You can write your code in this editor
old_x = 0;
old_y = 0;
BombParticleSystem = part_system_create();
bomb_particle = part_type_create();
part_type_shape(bomb_particle,pt_shape_square);
part_type_scale(bomb_particle,1,1);
part_type_size(bomb_particle,0.10,0.15,-.001,0);
part_type_color2(bomb_particle,1980118,1988566);
part_type_alpha2(bomb_particle,1,0.75);
part_type_speed(bomb_particle,0.1,0.5,0,0);
part_type_direction(bomb_particle,0,359,0,0);
part_type_gravity(bomb_particle,0.02,90);
part_type_orientation(bomb_particle,0,359,10,0,true);
part_type_life(bomb_particle,100,150);
part_type_blend(bomb_particle,true);
depth = 10;

bomb_emitter = part_emitter_create(BombParticleSystem);