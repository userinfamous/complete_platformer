//onFloor for when animating jump
if (place_meeting(x,y+1,oWall)) {
	onFloor = true;
} else {
	onFloor = false;
}

//basic intelligence
distance = distance_to_object(oPlayer); //check distance
if (distance < 200) {	//120 pixels radius
	
	//Follow the player, stop if too close (avoids twitching)
	with (oEnemyT1) { //all instances
		if (x-10 < oPlayer.x and x+10>oPlayer.x) { //the x id within range of 10
			hspd = 0;
		} else {
			hspd = spd * sign(oPlayer.x-x);
		}
	}
	
	//jumps frantically when there's a wall
	if (onFloor and place_meeting(x+sign(hspd),y,oWall)) {
		vspd = random_range(-4,-7);
	}
	
//outside range
} else {
	hspd = 0;
}

//basic collision for enemy against wall
collision();

//enemy collision other other enemies horizontally
if (place_meeting(x+hspd,y,oEnemyT1)) {
	while (!place_meeting(x+sign(hspd),y,oEnemyT1)) { //check until fails, if works too
		x += sign(hspd);
	}
	hspd = 0;
}

//enemy collision other other enemies vertically
if (place_meeting(x,y+vspd,oEnemyT1)) {
	while (!place_meeting(x,y+sign(vspd),oEnemyT1)) { //check until fails, if works too
		y += sign(vspd);
	}
	vspd = 0;
}

//move after checking
y += vspd;
x += hspd;

//Animations
if (hspd != 0) {
	image_xscale = sign(hspd);	//flip sprites
	image_speed = 1;
	sprite_index = sEnemyT1R;	//runing sprites
} else {
	sprite_index = sEnemyT1;		//idle sprites
}

if (!onFloor) {
	sprite_index = sEnemyT1A;	//in air
	image_speed = 0;
	switch (sign(vspd)) {		//jump up or down
		case -1: image_index = 0; break;
		case 1: image_index = 1; break;
	}
}