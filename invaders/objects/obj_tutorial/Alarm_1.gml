/// @description Insert description here
// You can write your code in this editor
if global.text_line == 9
{
	alarm[1] = 60;
}
e_bullet = instance_create_layer (room_width / 2,0,layer,obj_enemybullet);
e_bullet.direction = 270;
e_bullet.image_angle = 270 + 90;
e_bullet.speed = 6 * global.difficulty;
e_bullet.image_xscale = 1.5;
e_bullet.image_yscale = 1.5;