/// @description Update Camera
if (instance_exists(follow)) {
	xTo = follow.x;
	yTo = follow.y;
}

// updated position
x += (xTo - x) / 25;
y += (yTo - y) / 25;

//limit to display to room size
x = clamp(x,view_w_half,room_width-view_w_half);
y = clamp(y,view_w_half,room_height-view_h_half);

//update view
camera_set_view_pos(cam,x-view_w_half,y-view_h_half);//relative to camera object; the view is simply adjusting

