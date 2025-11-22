function draw_time(toRead = 0,hours = 0) {
	var tim,hrs,mins,secs,timstring,rmins

	tim = toRead
	mins = floor(tim / 1800)
	rmins = mins % 60
	hrs = (mins - rmins) / 60
	secs = floor((tim / 30) - (mins * 60))
	
	var hs,ms,ss

	hs = string(hrs) + ":"
	ms = string(mins) + ":"
	ss = string(floor(secs))
	
	if rmins < 10 {ms = "0" + ms}
	if secs < 10 {ss = "0" + ss}

	timstring = ms + ss

	if hours {timstring = hs + ms + ss}
	
	return timstring
}