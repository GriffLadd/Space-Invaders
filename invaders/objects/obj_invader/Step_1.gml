/// @description Insert description here
// You can write your code in this editor
col_count = 1;
max_steps = 16;
var val, highest, highest_val;
highest = noone;
highest_val = -1;
with (obj_invader) {
  val = column_num;
  if (highest == noone || val > highest_val) {
    highest = id;
    highest_val = val;
  }
}
if (highest != noone) {
	for (i = 0; i < 9; ++i)
	{
		  if highest_val == 11 - col_count
		  {
			  max_steps += 2*col_count;
		  }
		  ++ col_count
	}
}
var val, lowest, lowest_val;
lowest = noone;
lowest_val = -1;
with (obj_invader) {
  val = property;
  if (lowest == noone || val < lowest_val) {
    lowest = id;
    lowest_val = val;
  }
}
if (lowest != noone) {
  /* Use lowest here */
}