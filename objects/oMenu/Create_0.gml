/// @description GUI/Variables/Setup
gui_width = display_get_gui_width();
gui_height = display_get_gui_height();
gui_margin = 32;
menu_x = gui_width;
menu_y = gui_height/2;

menu_x_target = (gui_width/2);
menu_speed = 25;
menu_font = fMenu;
menu_itemHeight = font_get_size(fMenu);
menu_committed = -1;
menu_control = true;

menu[2] = "New Game";
menu[1] = "Continue";
menu[0] = "Quit";

menu_items = array_length_1d(menu);
menu_cursor = 2;


