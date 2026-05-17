function reset_timers() {
	for (var i = 0;i < array_length(timer);i++) {
		trigger[i] = 0
		timer[i] = 0
	}
}