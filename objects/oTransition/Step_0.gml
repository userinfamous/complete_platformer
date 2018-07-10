/// @description Animate Transition

if (mode != TRANSITION_MODE.OFF) {
	if (mode == TRANSITION_MODE.INTRO) { 
		percent = max(0,percent - max((percent/10),minDecrement));
	} else {
		percent = min(percentTarget,percent + max(((percentTarget - percent)/10),minDecrement));
	}
	
	if (percent == percentTarget or percent == 0) {
		switch (mode) {
			
			case TRANSITION_MODE.INTRO:
				mode = TRANSITION_MODE.OFF;
				break;
			
			case TRANSITION_MODE.NEXT:
				mode = TRANSITION_MODE.INTRO;
				room_goto_next();
				break;
			
			case TRANSITION_MODE.GOTO:
				mode = TRANSITION_MODE.INTRO;
				room_goto(target);
				break;
			
			case TRANSITION_MODE.GAME_RESTART:
				mode = TRANSITION_MODE.INTRO;
				game_restart();
				break;
				
			case TRANSITION_MODE.ROOM_RESTART:
				mode = TRANSITION_MODE.INTRO;
				room_restart();
				break;
		}
	}
}