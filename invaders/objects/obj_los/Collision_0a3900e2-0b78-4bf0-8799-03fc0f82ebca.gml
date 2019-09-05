// If projectile hits an invader, return line of sight as false
if instance_exists(parent)
{
	parent.line_of_sight = false;
	instance_destroy()
}
