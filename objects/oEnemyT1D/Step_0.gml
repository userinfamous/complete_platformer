//basic properties
if (done == 0) {
	//fallen down
	if (vspd == 0) {
		done = 1;
		image_index = 1;
	}
	
	collision();
	
	//move
	x += hspd;
	y += vspd;
}