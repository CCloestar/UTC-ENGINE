switch global.gamemode {
	default: //UNDERTALE
		if u_hold() {idir = 270}
		if d_hold() {idir = 90}
		if l_hold() {idir = 0}
		if r_hold() {idir = 180}
			
		if dir != idir {
			if !idir and dir > 180 {
				neg = 1
				dir -= 360
			}
	
			if dir >= 0 and dir < 90 and idir = 270 {
				neg = 2
				dir = 360
			}

			switch neg {
				case 0:
					dir %= 360
					dif = (idir - dir)
					dir += (dif * (2 / 3))
			
					if dir < 0 {dir += 360}
			
					if abs(dif) < 15 {
						dir = idir
						neg = 0
					}
				break
		
				case 1:
					dir %= 360
					dif = abs(idir - dir)
					dir += (dif * (2 / 3))
			
					if abs(abs(idir) - abs(dir)) < 15 {
						dir = idir
						neg = 0
					}
				break
		
				case 2:
					dif = idir - dir
					dir += (dif * (2 / 3))
			
					if abs(abs(idir) - abs(dir)) < 15 {
						dir = idir
						neg = 0
					}
				break
		
				case 3:
					dif = idir + dir
					dir -= (dif * (2 / 3))
			
					if abs(abs(idir) - abs(dir)) < 15 {
						dir = idir
						neg = 0
					}
				break
			}
		}
	
		var lblue = merge_color(c_blue,c_white,0.25)
		draw_set_circle_precision(12)
		if f < 2 {draw_set_color(lblue)}
		else {draw_set_color(c_red)}

		f--

		var t = degtorad(dir)
		var r = 30

		draw_line_width((x - (cos(t) * r)) + ((-sin(t)) * r), (y + (sin(t) * r)) + ((-cos(t)) * r), (x + ((-cos(t)) * r)) + (sin(t) * r), (y + (sin(t) * r)) + (cos(t) * r), 3)
		draw_set_color(lblue)
		draw_line_width((x - (cos(t) * r)) + ((-sin(t)) * r), (y + (sin(t) * r)) + ((-cos(t)) * r), (x + (((-(cos((t - 0.2)))) * r) / 2)) + ((sin((t - 0.2)) * r) / 2), (y + ((sin((t - 0.2)) * r) / 2)) + ((cos((t - 0.2)) * r) / 2), 3)
		draw_set_color(c_green)
		draw_circle(x,y,r,1)
		var tidir = degtorad(idir)
		var col = collision_line((x - (cos(tidir) * r)) + ((-sin(tidir)) * r), (y + (sin(tidir) * r)) + ((-cos(tidir)) * r), (x + ((-cos(tidir)) * r)) + (sin(tidir) * r), (y + (sin(tidir) * r)) + (cos(tidir) * r),bullet,0,1)

		if col != noone {
			with (col) {destroy()}

			audio_play(bell)
			f = 5
			dir = idir
		}
	break
}