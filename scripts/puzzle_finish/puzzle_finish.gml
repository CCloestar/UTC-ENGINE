function puzzle_finish(to_finish = -1) {
	if to_finish = -1 {
		p = [o_spikes,o_lever,o_butt]
		p.trigger = 1
	}
	else {to_finish.trigger = 1}
}