var b = battle_globals

board_limit(l)
board_limit(u)
board_limit(d)
board_limit(r)

for (var i = 0;i < 2;i++) {
	midx[i] = round(l[i] + ((r[i] - l[i]) / 2) - 10)
	midy[i] = round(u[i] + ((d[i] - u[i]) / 2) - 10)
}

switch preset {
	case -2:
		for (var i = 0;i < 2;i++) {
			l[i] = 37
			u[i] = 255
			r[i] = 601
			d[i] = 384
		}

		preset = -1
	break
	
	case 0:
		l[0] = 37
		u[0] = 255
		r[0] = 601
		d[0] = 384
		
		preset = -1
	break
	
	case 1:
		l[0] = 242
		u[0] = 255
		r[0] = 396
		d[0] = 384
		
		preset = -1
	break
}

switch b.boardId {
	default:
		var col = b.acol

		draw_box(l[1] - 5,u[1] - 5,r[1] + 5,d[1] + 5,col,,5)
	break
}

if global.debug and display.d {
	draw_font(1,0)
	draw_set_halign(fa_center)
	draw_set_color(c_silver)
	draw_txt(l[1],u[1] - 32,string(l[1]) + "," + string(u[1]) + "," + string(r[1]) + "," + string(d[1]),1,1)
	draw_txt(l[1],d[1] + 32,string(l[0]) + "," + string(u[0]) + "," + string(r[0]) + "," + string(d[0]),1,1)
	draw_set_halign(fa_left)
	draw_txt(r[1] + 8,u[1] + 16,"PRESET: " + string(preset),1,1)
}
	
function board_limit(limit) {
	if limit[1] != limit[0] {
		if abs((limit[1] - limit[0])) <= 15 {limit[1] = limit[0]}
		else {
			if limit[1] > limit[0] {limit[1] -= 15}
			else {limit[1] += 15}
		}
	}
}