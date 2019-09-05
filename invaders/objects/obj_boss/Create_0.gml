/// @description Initialize variables

image_speed = 0;
global.boss_health = 50;
newpoint = true;
bul_side = 0;
burst_delay = 5;
firing = false;
alarm[0] = 300;
moveto_x = room_width / 2;
moveto_y = 266;
current_attack = "laser";
attacks = 0;
stunned = false;
second_phase = false;
bullet_accuracy = 30;
bullet_speed = 6;
movement_speed = 7;
burst_count = 5;
slam_speed = 10;
slam_passed = false;
audio_play_sound(snd_boss, 1, 1);
stun_multiplier = 1;
depth = -10;
frequency = 0.05;
amplitude = 0.5;
timer = 0;

instance_create_layer (x,y,layer,obj_bossbarrier);