/// @description Burst fire

++burst;
bullet_direction += 180;

ball = instance_create_layer (x,y,"Instances_2",obj_homing_ball);
ball.direction = bullet_direction;
ball.speed = bullet_speed;

if burst < burst_count
{
	alarm[2] = burst_delay;
}
else if current_attack == 3
{
	fired = true;	
}
