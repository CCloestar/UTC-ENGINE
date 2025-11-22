for (var i = 0;i < 2;i++) {
	l[i] = 37
	u[i] = 255
	r[i] = 601
	d[i] = 384
	
	midx[i] = round(l[i] + ((r[i] - l[i]) / 2) - 10)
	midy[i] = round(u[i] + ((d[i] - u[i]) / 2) - 10)
}

preset = -1
reset = 0
can_reset = 1