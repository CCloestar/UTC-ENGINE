var b = battle_globals

board_limit(l)
board_limit(u)
board_limit(d)
board_limit(r)

for (var i = 0;i < 2;i++) {
	midx[i] = round(l[i] + ((r[i] - l[i]) / 2) - 10)
	midy[i] = round(u[i] + ((d[i] - u[i]) / 2) - 10)
}

var prData = {
	"0": [37,255,601,384,0],
	"-2": [37,255,601,384,1],
	"1": [242,255,396,384,0]
}

if preset != -1 {
	var pr = prData[$ preset] ?? "0"
	for (var i = 0;i < 1 + pr[4];i++) {
		l[i] = pr[0]
		u[i] = pr[1]
		r[i] = pr[2]
		d[i] = pr[3]
	}

	preset = -1
}

switch b.boardId {
	default:
		var col = dark ? merge_color(c_green, c_lime, 0.5) : b.acol
		draw_b(l[1] - 5,u[1] - 5,r[1] + 5,d[1] + 5,col,,5)
	break
}

if in_debug() {
	draw_font(1)
	draw_set_halign(fa_center)
	draw_col(c_silver)
	draw_txt(l[1],u[1] - 32,$"{l[1]},{u[1]},{r[1]},{d[1]}",1)
	draw_txt(l[1],d[1] + 32,$"{l[0]},{u[0]},{r[0]},{d[0]}",1)
	draw_set_halign(fa_left)
	draw_txt(r[1] + 8,u[1] + 16,$"PRESET: {preset}",1)
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