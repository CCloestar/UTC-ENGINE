function c_rm_ruins2bp_1(){
	if !global.story[4] {
		switch trigger[0] {
			case 0:
				if r2_rock0.y <= 100 and r2_rock1.y >= 170 and r2_rock2.y <= 100 {
					a = dial_create()
					for (var i = 0;i < 3;i++) {a.m[i] = tr($"tori_13_{i}")}
					audio_play(press,,,0.4)

					trigger[0] = 1
				}
			break

			case 1:
				if dial_exists() {
					if a.cur_m {a.snd = dial_toriel}
				}
				else {global.story[4]++}
			break
		}
	}
	
	if global.story[4] > 1.1 {end_cuts(4,2)}
}