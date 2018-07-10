/// @description Ease in transition

menu_x += (menu_x_target - menu_x)/menu_speed;

//keyboard controls
up = keyboard_check_pressed(vk_up) or keyboard_check_pressed(ord("W"));
down = keyboard_check_pressed(vk_down) or keyboard_check_pressed(ord("S"));
enter = keyboard_check_pressed(vk_enter);

if (menu_control) {
	if (up) {
		menu_cursor++;
		if (menu_cursor > 2) menu_cursor = 0;
	}
	if (down) {
		menu_cursor--;
		if (menu_cursor < 0) menu_cursor = 2;
	}
	if (enter) {
		menu_x_target = gui_width + 200;
		menu_committed = menu_cursor;
		ScreenShake(4,30);
		menu_control = false;
	}
}

if (menu_x > gui_width + 150) and (menu_committed != -1) {
	switch(menu_committed) {
		case 2: SlideTransition(TRANSITION_MODE.NEXT); break;
		
		case 1:
			if file_exists(SAVEFILE) {
				var file = file_text_open_read(SAVEFILE);
				var target = file_text_read_real(file);
				file_text_close(file);
				SlideTransition(TRANSITION_MODE.GOTO,target);
			} else {
				SlideTransition(TRANSITION_MODE.NEXT);
			}
			break;
		
		case 0: game_end(); break;
	}
}

