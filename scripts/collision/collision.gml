//collision
if (vspd < TERMINAL_VELOCITY) {
	vspd += grav;
} else {
	vspd = TERMINAL_VELOCITY;
}

if (place_meeting(x+hspd,y,oWall)) {
	while (!place_meeting(x+sign(hspd),y,oWall)) { //check until fails, if works too
		x += sign(hspd);
	}
	hspd = 0;
}
if (place_meeting(x,y+vspd,oWall)) {
	while (!place_meeting(x,y+sign(vspd),oWall)) {
		y += sign(vspd);
	}
	vspd = 0;
}
