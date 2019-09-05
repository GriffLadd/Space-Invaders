/// @description Insert description here
// You can write your code in this editor
scr_beamcharge()
effect_create_above(ef_flare, x, y, 40, c_white);
audio_play_sound(snd_barrier_absorb, 1, 0);
instance_destroy();