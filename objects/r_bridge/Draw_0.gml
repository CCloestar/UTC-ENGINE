var fr = 0

for (var i = 0;i < lim;i++) {
	var yy = y + (20 * i)

	for (var o = 0;o < 2;o++) {
		var _p
		_p[o] = 8 * (o + 2)
		if yy >= y + (20 * _p[o]) - 20 {fr = 3 + o}
		if yy >= y + (20 * _p[o]) {fr = 1 + o}
	}

	if yy = 300 {fr = 5}
	if yy = 320 {fr = 30}
	if yy = 340 or yy = 440 {fr = 0}

	if yy = 400 {fr = 10}
	if yy = 420 {fr = 25}

	if yy = 720 {fr = 7}
	if yy = 740 {fr = 17}
	if yy = 760 {fr = 32}

	if yy = 960 {fr = 12}
	if yy = 980 or yy = 1000 {fr = 22}
	if yy = 1020 {fr = 27}

	var xs = 0
	var ys = 0
	var r = ((0 - yy) * -1) / 20

	if trigger[i] {
		timer[i]++

		if timer[i] < r * 2 {
			if timer[i] % 2 == 0 {
				ys = rnd_r(1,-1)
				xs = rnd_r(1,-1) * !global.simpleVFX

				audio_play(bump,,,rnd_r(0.2,0.6),,rnd_r(0.6,0.9))
			}
		}
		else {
			switch trigger[i] {
				case 2:
					timer[i] = 0
				break

				case 3:
					ang[i,1] = irnd_r(20,-20)
					_x[i] = ang[i,1] * 0.01

					audio_play_echo(bump,,,rnd_r(0.3,1),,rnd_r(0.6,0.9),0.4,0.2,1)
					trigger[i] = 3.5
				break

				case 3.5:
					var y_ = 1
					_y[i,0] += 0.4
					_y[i,1] -= _y[i,0] - y_
					if _y[i,0] > y_ + 4 {alp[i] += 0.05}

					ang[i,1] += ang[i,0] * 0.01
				break
			}
		}
	}

	var __x = (x + xs) - _x[i]
	var __y = (yy + ys) - _y[i,1]

	if alp[i] < 1 {
		draw_spr(r4_bridge,fr,__x,__y,,ang[i,1],c_white,1)
		draw_spr(r4_bridge,fr,__x,__y,,ang[i,1],c_black,alp[i])
	}

	if c_hold() and (l_pressed() or r_pressed()) and global.debug {
		trigger[i] += r_pressed() - l_pressed()
		timer[i] = 0
		if trigger[i] < 0 {trigger[i] = 0}
	}
}