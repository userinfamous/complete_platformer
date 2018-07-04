draw_self();

if (flash > 0) {
		flash--;
		draw_sprite_ext(sEnemyT1,image_index,x,y,image_xscale,image_yscale,image_angle,c_red,1);
}