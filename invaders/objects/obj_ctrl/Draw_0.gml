/// @description Health bars and info

// Information bars
draw_set_color(c_red);
draw_rectangle(10,10,10+(100-10)*(health),30,0);

draw_set_color(c_white);
draw_rectangle(10,10,100,30,2);

draw_set_color(c_aqua);
draw_rectangle(10,40,10+(100-10)*(global.shield_cd / 60),60,0);

draw_set_color(c_white);
draw_rectangle(10,40,100,60,2);

draw_set_color(c_white);
draw_rectangle(10,70,10+(100-10)*(global.beam_energy),90,0);

draw_set_color(c_white);
draw_rectangle(10,70,100,90,2);

draw_set_halign(fa_left);
if global.beam_energy == 1
{
	draw_text(room_width - 125, room_height - 25, "Q : Giga Beam")
}

// Boss healthbar
if instance_exists(obj_boss) and global.boss_started
{
	draw_set_color(c_red);
	draw_rectangle(200,10,200+(room_width-400)*(global.boss_health/50),30,0);
	draw_set_color(c_dkgray);
	draw_rectangle(200,10,room_width-200,30,2);
	draw_set_color(c_white);
}

// Game Over
if restart
{
	draw_set_halign(fa_center);
	draw_text(room_width/2, room_height - 100, "You are dead. Press space to restart.");
	draw_set_halign(fa_left);
}

// Keep score
draw_text(10, room_height - 25, "Score : " + string (score));