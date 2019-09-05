/// @description Insert description here
// You can write your code in this editor
/// @description Initialize variables

image_speed = 0;
global.boss_health = 50;
global.boss_started = true;

// Whether or not a direction has been chosen for the bomb attack
dir_chosen = true;

// The direction of the bomb attack
bomb_dir = 1;

// Whether or not the boss has to move to a new point
newpoint = true;

// Delay between firing homing balls
burst_delay = 20;

// Whether or not the boss is currently firing its guns
firing = false;

// Whether or not the boss has already fired
fired = false;

// Direction of where the bullet shoots out
bullet_direction = 0;

// Tells the boss where to move on the x and y axis
moveto_x = room_width / 2;
moveto_y = 266;

// The current attack that the boss is performing
current_attack = 1;

// Whether or not the boss has to decide on a new attack
new_attack = 0;

// How many times the boss has fired already in its current burst
burst = 0;

// Whether or not the boss is stunned and can't do anything
stunned = false;

// Whether or not the boss has reached its second phase
second_phase = false;

// The speed of bullets
bullet_speed = 4;

// Default movement speed for the boss
movement_speed = 7;

// How many projectiles to fire per burst
burst_count = 10;

// If the boss has completed its bomb sweep
sweep_completed = false;

// If the boss has swapped bomb directions yet
swapped = false;

// The number of bombs that have been dropped
i = 0;

// The point where the bombs leave a gap
bomb_gap = 0;

frequency = 0.05;
amplitude = 0.5;
timer = 0;

audio_play_sound(snd_boss, 1, 1);
nextpoint_x = room_width / 7;
depth = -10;
