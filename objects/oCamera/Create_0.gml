/// @description Setup Camera
cam = view_camera[0];
follow = oPlayer;
view_w_half = camera_get_view_width(cam)/2;
view_h_half = camera_get_view_height(cam)/2;
xTo = xstart;
yTo = ystart;

shake_length = 0;
shake_magnitude = 0;
shake_remain = 0;
buff = 32;

//get id of layer once beforehand
if (layer_exists("Mountains")) {
	mountains = layer_get_id("Mountains");
} else {
	mountains = false;	
}

if (layer_exists("Trees")) {
	trees = layer_get_id("Trees")
} else {
	trees = false;
}