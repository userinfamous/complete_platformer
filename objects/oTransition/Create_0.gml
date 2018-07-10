/// @description Size variables and mode setup

w = display_get_gui_width();
h = display_get_gui_height();
h_half = h/2;

enum TRANSITION_MODE {
	OFF,
	NEXT,
	GOTO,
	GAME_RESTART,
	ROOM_RESTART,
	INTRO
}

mode = TRANSITION_MODE.INTRO;
percent = 1;
percentTarget = 1.2;
minDecrement = 0.005;
target = room;