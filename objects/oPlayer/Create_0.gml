///@description Player Setup
//object player
hspd = 0;
vspd = 0;
jspd = -7;
grav = 0.2;
spd = 4;
onFloor = false;

controller = 0;
gp_num = gamepad_get_device_count(); //number of connected devices
gp_current = 0;
gp_connected = false;



enum playerStates {
	idle,
	walking,
	jumping
}