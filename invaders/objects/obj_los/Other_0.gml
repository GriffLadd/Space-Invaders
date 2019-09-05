// Returns true line of sight if reaches outside room
if instance_exists(parent)
{
	parent.line_of_sight = true;
	instance_destroy()
}
