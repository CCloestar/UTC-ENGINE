function end_cuts(cuts = 0,value = 1){
	if global.story[cuts] != value {
		global.story[cuts] = value
		if global.howfar < cuts {global.howfar = cuts}
	}
}