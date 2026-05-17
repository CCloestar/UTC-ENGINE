lim = room_height / 20
sndplay = 0

for (var i = 0;i < lim;i++) {
	trigger[i] = 0
	timer[i] = 0
	alp[i] = 0
	_x[i] = 0

	for (var o = 0;o < 2;o++) {
		ang[i,o] = 0
		_y[i,o] = 0
	}
}