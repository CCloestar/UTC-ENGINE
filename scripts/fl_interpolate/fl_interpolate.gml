function fl_interpolate(){
	with (o_follower) {
		var c = o_mainchara
		
		_x[0] = c.x
		_y[0] = c.y
		_f[0] = c.f
		
		for (var i = fl;i > 0;i--) {
			_f[i] = 2
			_x[i] = c.x + ((x - c.x) * (i / fl))
			_y[i] = c.y + ((y - c.y) * (i / fl))
		}
	}
}