///@description Player states
//run for every frame

#region //Connecting to controller
if (gp_connected == false) { //check for gamepad
	for (i = 0; i <= gp_num; i++;) {
	   if (gamepad_is_connected(i)) {
		   gp_current = i; 
		   gp_connected = true;
	   } else {
		   gp_connected = false;
	   }
	}
}
#endregion

#region //User Input

if (hasControl) {

	left = keyboard_check(vk_left) or keyboard_check(ord("A"));
	right = keyboard_check(vk_right) or keyboard_check(ord("D"));
	jump = keyboard_check_pressed(vk_up) or keyboard_check(ord("W"));

	if (left or right or jump) controller = 0; //check for controller type

	if (abs(gamepad_axis_value(gp_current,gp_axislh)) > 0.2) { //over deadzone means activation
		left = abs(min(gamepad_axis_value(gp_current,gp_axislh),0));
		right = max(gamepad_axis_value(gp_current,gp_axislh),0);
		controller = 1;
	}

	if (gamepad_button_check_pressed(gp_current,gp_face1)) {
		jump = true;
		controller = 1;
	}

} else {
	//variables must be define regardless
	left = 0;
	right = 0;
	jump = 0;
}

#endregion

//1 - 0 = (1) right, 0 - 1 = (-1) left; keyboard checks for true or false
var move = right-left;
hspd = move * spd;

#region//onFloor for when animating jump
if (place_meeting(x,y+1,oWall)) {
	onFloor = true;
	if (jump) {		//press jump
		vspd = jspd;
	}
} else {
	onFloor = false;
}

#endregion

//collision
collision();

//move after collision checking
y += vspd;
x += hspd;

#region//Animations

if (hspd != 0) {
	image_xscale = sign(hspd);	//flip sprites
	image_speed = 1;
	sprite_index = sPlayerR;	//runing sprites
} else {
	sprite_index = sPlayer;		//idle sprites
}

if (!onFloor) {
	sprite_index = sPlayerA;	//in air
	image_speed = 0;
	switch (sign(vspd)) {		//jump up or down
		case -1: image_index = 0; break;
		case 1: image_index = 1; break;
	}
}
#endregion