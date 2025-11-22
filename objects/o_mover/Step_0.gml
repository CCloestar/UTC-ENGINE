if i_exists(d[0]) {
	if !gravity	{
		x = d[0].x
		y = d[0].y

		var mx = d[1].x
		var my = d[1].y
		
		dist = distance_to_point(mx,my)
		dir = point_direction(x,y,mx,my)
		amt = dist / sp

		gravity = 1
	}

	d[0].x += lengthdir_x(amt,dir)
	d[0].y += lengthdir_y(amt,dir)
	
	if abs(d[0].x - d[1].x) < 1 and abs(d[0].y - d[1].y) < 1 {destroy()}
}
else {destroy()}