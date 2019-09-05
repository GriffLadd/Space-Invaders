/// @description Insert description here
// You can write your code in this editor
if not cooldown_set
{
	cooldown = text_speed;
	cooldown_set = true;
}

if (text_length <= 0)
{
   // at this point, the "text" variable should hold the text we want to display
   text_length = string_length(text);
}

if text_start = true
{
	if (index < text_length)
	{
	   cooldown--; // decrementing the cooldown.
  
	   // only add characters when we're not finished
	   if (cooldown <= 0) // when the cooldown reaches 0
	   {
	       index++; // advance one character in the text
	       text_displayed = string_copy(text, 1, index); // starting from the 1st char in "text" we the amount of "index" characters to the displayed_text
	       cooldown = text_speed; // resetting the cooldown for the next character
	   }
	}
	else if alarm[0] == -1
	{
		global.text_finished = true;
		alarm[0] = text_decay;
	}
}
