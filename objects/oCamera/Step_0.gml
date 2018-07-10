/// @description Update Camera
if (instance_exists(follow)) {
	xTo = follow.x;
	yTo = follow.y;
}

// updated position
x += (xTo - x) / 25;
y += (yTo - y) / 25;

//limit to display to room size
x = clamp(x,view_w_half+buff,room_width-view_w_half-buff);
y = clamp(y,view_w_half+buff,room_height-view_h_half-buff);

// Screen Shake
if (shake_magnitude != 0) {
	x += random_range(-shake_remain,shake_remain);
	y += random_range(-shake_remain,shake_remain);
	// shake_remain = 6 - 1/60 * 6 or  6 - (1/6) for every step.
	shake_remain = max(0, shake_remain-((1/shake_length)*shake_magnitude));
}

//update view
camera_set_view_pos(cam,x-view_w_half,y-view_h_half);//relative to camera object; the view is simply adjusting


//Parrallax background
if (mountains != false) {
	layer_x(mountains,x/2);
}

if (trees != false) {
	layer_x(trees,x/4);
}

