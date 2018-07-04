//location
x = oPlayer.x;
y = oPlayer.y+12;

//handling controls
switch(oPlayer.controller) {
	
	case 0 : //mouse and keyboard
	image_angle = point_direction(x,y,mouse_x,mouse_y);	//follow mouse
	break; 
	
	case 1 : //gamepad controller
	var controllerh = gamepad_axis_value(oPlayer.gp_current,gp_axisrh);
	var controllerv = gamepad_axis_value(oPlayer.gp_current,gp_axisrv);
	if (abs(controllerh) > 0.2 or abs(controllerv) > 0.2 ) {
		controllerAngle = point_direction(0,0,controllerh,controllerv);
	}
	image_angle = controllerAngle;
	break;
}

//scaling the image vertically
if (image_angle > 90 and image_angle < 270) image_yscale = -1 else image_yscale = 1;


firingDelay -= 1; //count down every step
recoil = max(0,recoil-1); //decreases every step

//trigger
if ( (mouse_check_button(mb_left) or gamepad_button_check(oPlayer.gp_current,gp_shoulderrb)) and (firingDelay < 0)) {
	recoil = 4;
	firingDelay = 5;
	with (instance_create_layer(x,y,"Bullet",oBullet)) {
		accuracy = random_range(-3,3); //variable must exist for all bullets created
		speed = 25;
		direction = other.image_angle + accuracy;
		image_angle = direction;
	}
}

//adding recoil
x = x-lengthdir_x(recoil,image_angle);
y = y-lengthdir_y(recoil,image_angle);