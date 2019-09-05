/// @description Initialize Values

x = window_get_width() / 2;
shield_usable = true;
health = 1;
vulnerable = true;
image_speed = 0;
can_fire = true;
fire_delay = 12;
bullet_speed = 15;
player_speed = 5;

// Seed for sprite explosion
randomize();
my_part = noone;