//preset to move when dying
hspd = sign(oPlayer.x-mouse_x)*-3 + 0.01; //prevent bugs
vspd = -4;
grav = 0.3;
done = 0;

image_speed = 0;
image_xscale = sign(hspd) + 0.01;	//patched on again

ScreenShake(6,25);