///@description GamePad Connection
//connecting to controller
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