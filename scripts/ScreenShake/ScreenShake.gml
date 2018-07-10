///@desc ScreenShake(magnitude,duration_in_frames)
///@arg Magnitude: sets the strength of pixels it is shaking.
///@arg Duration: sets the time in steps/frames per second. Game is 60 fps

with (oCamera) {
	if (argument[0] > shake_remain) {
		shake_magnitude = argument[0];
		shake_remain = argument[0];
		shake_length = argument[1];
	}
}

