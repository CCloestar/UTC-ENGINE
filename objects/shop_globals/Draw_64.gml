var _l = 1
var _ex = 0
var _g = 0
var j = l_check()
var s = 40
var ds = 10/2
var db = 8 * dw
var jx = 20 * j
var go = tr_u($"g_{dw}")

var sh = [
	[dial_main,2,4]
]

var si = global.shop_id
si = clamp(si,0,arlen(sh) - 1)
if sh[si,1] = 2 and trigger[3] {sh[si,1] = 1}

if dw {draw_rec(0,240,641,481,,c_black)}

if trigger[0] = 1 {
	var top = 162 + (18 * dw)
	var bot = 240 + (18 * dw)

	if timer[1] < 4 {
		if b_y < top {b_y += 6}
		if b_y < top - 24 {b_y += 2}
		if b_y < top - 40 {b_y += 2}
		if b_y < top - 80 {b_y += 8}
		if b_y < top - 116 {b_y += 5}
		if b_y >= top {b_y = top}
	}
	else {b_y = clamp((b_y - 40) * dw,0,b_y)}

	var bby = [481 - (171 * dw),50 * dw,(6 * j * (timer[1] < 4) * !dw)]
	draw_b(420 - (12 * dw) + jx,(bot - b_y) - bby[1] - bby[2],641 - (9 * dw),247,,,8,,dw,ds)
	draw_col(c_white)
	if timer[1] < 4 {draw_txt((448 - db) + jx,(bot + 36 - b_y - bby[1] - db) - bby[2],tr($"{it[si,timer[1]][1]}_desc"))}
}

draw_b(0 + db,240 + db,(641 - (9 * dw * !d_b)) - d_b + (jx * (d_b > 0)),481 - db,,,8,,dw,ds)
if d_b {draw_b(420 - (12 * dw) + jx,240 + db,643 - (11 * dw),481 - db,,,8,,dw,ds)}

draw_font(1)
draw_col(c_white)

switch trigger[0] {
	#region SELECTION
		case 0:
			shop_dial(si,sh,tr($"sh{si}_{timer[0]}"))

			var t = ["Buy","Sell","Talk",!j ? "Exit" : "でる"]
			for (var i = 0;i < 4;i++) {draw_txt(480 + jx,268 + (s * i),tr(t[i]))}

			timer[0] += d_pressed() - u_pressed()
			if timer[0] < 0 {timer[0] = 3}
			if timer[0] > 3 {timer[0] = 0}

			if z_pressed() {
				dial_destroy()
				item_check()

				trigger[0] = timer[0] + 1
				trigger[1] = item_amt()
				timer[2] = 0
			}

			sh_heart(450 + jx,268 + (s * timer[0]))
		break
	#endregion

	#region BUY
		case 1:
			if arlen(it[si]) <= 0 {
				shop_dial(si,sh,tr($"-b_sh{si}"))
				_l = 0
				if !dial_exists() {trigger[0] = 0}
			}
			else {
				for (var i = 0;i < arlen(it[si]);i++) {
					var _x = 60 + ((12 + (2 * j)) * (it[si,i][0] < 10))
					var itxt = $"{it[si,i][0]}{go} - "

					draw_txt(_x,268 + (s * i),itxt)
					draw_txt(_x + (str_w(itxt) * 2),268 + (s * i),it[si,i][1],[it[si,i][3],it[si,i][4]])
				}

				if trigger[4] < 6 {
					if !dial_exists() {
						a = dial_create(460,268 + (db * j))
						a.preset = -1
						a.finish = 0
						a.y_sep = 36 + (2 * j)
						a.snd = sh[si,0]
						a.m = [tr($"b{trigger[4]}_sh{si}")]
					}

					if u_pressed() {
						timer[1]--
						if timer[1] = arlen(it[si]) {timer[1] = arlen(it[si]) - 1}
					}

					if d_pressed() {
						timer[1]++
						if timer[1] >= arlen(it[si]) and timer[1] < 4 {timer[1] = 4}
					}

					if timer[1] < 0 {timer[1] = 4}
					if timer[1] > 4 {timer[1] = 0}

					sh_heart(30,268 + (s * timer[1]))

					if z_pressed() and timer[1] < 4 {
						trigger[4] = 6
						timer[4] = 0
						dial_destroy()
					}

					if x_pressed() or (z_pressed() and timer[1] = 4) {
						trigger[0] = 0
						dial_destroy()
					}		
				}
				else {
					draw_txt(460,268 + (8 * j),tr($"b?_sh{si}_{dw}",timer[1]))

					var op = ["Yes","No"]
					for (var i = 0;i < 2;i++) {draw_txt(480 + (12 * j),348 + (30 * i),tr(op[i]))}

					if u_pressed() or d_pressed() {timer[4] = !timer[4]}
					if x_pressed() or (z_pressed() and timer[4]) {trigger[4] = 2}

					if z_pressed() and !timer[4] {
						var pr = it[si,timer[1]][0]
						var no = 1

						if global.g[dw] - pr < 0 {no = 3}
						if item_amt() >= 8 {no = 4}
						if it[si,timer[1]][5] = 0 {no = 5}

						if no = 1 {
							global.g[dw] -= pr
							add_item(it[si,timer[1]][2])
							audio_play(buy)
						}

						trigger[4] = no
						it[si,timer[1]][5]--
					}

					sh_heart(450 + jx,348 + (30 * timer[4]))
				}

				_ex = 1
			}
		break
	#endregion

	#region SELL
		case 2:
			if !sh[si,1] or !trigger[1] {
				shop_dial(si,sh,tr($"-s{!trigger[1]}_sh{si}"))
				_l = 0
				if !dial_exists() {trigger[0] = 0}
			}
			else {
				for (var i = 0;i < trigger[1];i++) {
					var _i = [0,global.item[i,(3 * dw)],global.item[i,(3 * dw) + (1 + tense)]]
					_i[0] = item_pr(_i[1])
					var sold = i > (item_amt() - 1)
					var itxt = !sold ? $"{_i[0]}{go} - " : ""

					if sold {_i[2] = tr($"s1_sh{si}")}
					else {
						var xp = 14 * ((_i[0] < 100) + (_i[0] < 10))
						draw_txt((60 + (294 * (i % 2 == 1))) + xp,268 + (s * floor(i / 2)),itxt)
					}

					var isc = 2 - ((trlen(_i[2]) > 6) * l_check())

					draw_col(sold ? c_gray : c_white)
					draw_txt(60 + (24 * dw) + (294 * (i % 2 == 1)) + ((str_w(itxt) * 2) - 24),268 + (s * floor(i / 2)),tr(_i[2]),[isc,2],!sold)
				}

				if l_pressed() and timer[2] % 2 == 1 {timer[2]--}
				if r_pressed() and timer[2] % 2 == 0 and timer[2] + 1 < item_amt() {timer[2]++}

				if u_pressed() and (timer[2] - 2) > -1 {
					timer[2] -= 2
					if timer[2] < 0 {timer[2] = 0}
					if timer[2] > (item_amt() - 1) {
						if item_amt() % 2 == 0 {timer[2] = item_amt() - 2}
						else {timer[2] = item_amt() - 1}
					}
				}

				if d_pressed() {
					timer[2] += 2
					if timer[2] > (item_amt() - 1) {timer[2] = 8}
				}

				if x_pressed() or (z_pressed() and timer[2] = 8) {trigger[0] = 0}
				if z_pressed() and timer[2] < 8 {
					trigger[0] = 2.5
					timer[5] = 0
				}

				sh_heart(30 + (294 * (timer[2] % 2 == 1)),268 + (s * floor(timer[2] / 2)))
				_g = 1
				_ex = 1
			}

			_l = 0
		break

		case 2.75:
		case 2.5:
			var ite = [global.item[timer[2],3 * dw],global.item[timer[2],(3 * dw) + (1 + tense)]]
			var b = 1 + ceil(0.25 * (trigger[0] > 2.5))

			draw_txt(110,308,tr($"s0_sh{si}_{b > 1}",ite[1],item_pr(ite[0]) * b))

			var op = ["Yes","No"]
			for (var i = 0;i < 2;i++) {draw_txt(160 + (220 * i),368,tr(op[i]))}

			sh_heart(130 + (220 * timer[5]),370)

			if l_pressed() or r_pressed() {timer[5] = !timer[5]}

			var chb = 0

			if z_pressed() {
				if !timer[5] {
					audio_play(buy)
					global.g[dw] += item_pr(ite[0]) * b
					global.item[timer[2],3 * dw] = ""
					item_check()

					if timer[2] > (item_amt() - 1) {timer[2] = (item_amt() - 1)}
					trigger[0] = 2 * (item_amt() > 0)
				}
				else {
					if trigger[0] = 2.5 {
						if sh[si,1] = 1 {chb = 1}
						else {trigger[0] = 2.75}
					}
					else {chb = 1}

					if chb {
						trigger[4] = 1
						trigger[0] = 2
						trigger[3] = 1
					}

					timer[5] = 0
				}
			}

			if x_pressed() {trigger[0] = 2}

			_g = 1
			_l = 0
		break
	#endregion

	#region TALK
		case 3:
			var _t = sh[si,2]

			if !_t {
				shop_dial(si,sh,tr($"-t_sh{si}"))
				_l = 0
				if !dial_exists() {trigger[0] = 0}
			}
			else {
				if !dial_exists() {
					a = dial_create(460 + jx,268 + (db * j))
					a.preset = -1
					a.finish = 0
					a.y_sep = 36 + (2 * j)
					a.snd = sh[si,0]
					a.m = [tr($"t_sh{si}")]
				}

				if d_pressed() {
					timer[3]++
					if timer[3] > _t and timer[3] < 4 {timer[3] = 4}
					if timer[3] > 4 {timer[3] = 0}
				}

				if u_pressed() {
					timer[3]--
					if timer[3] = _t {timer[3] = _t - 1}
					if timer[3] < 0 {timer[3] = 4}
				}

				var tri = trigger[0]

				if z_pressed() and timer[3] < 4 {trigger[0] = 3.5}
				if (z_pressed() and timer[3] = 4) or x_pressed() {trigger[0] = 0}

				if tri != trigger[0] {dial_destroy()}
				for (var i = 0;i < _t;i++) {draw_txt(60,268 + (s * i),tr($"to{i}_sh{si}"))}
				sh_heart(30,268 + (s * timer[3]))

				_ex = 1
			}
		break

		case 3.5:
			shop_dial(si,sh,tr($"t{timer[3]}_sh{si}"))
			var td = dialogue

			if dial_exists() {
				var t_d = [
					[
						["This is Talk0 Message.","It is a Test if It supports&&multiple messages."],
						["12345678910"],
						["Hell YEah","yeah","yuh"],
						["Last Message"]
					]
				]

				td.m = t_d[si,timer[3]]
			}
			else {trigger[0] = 3}

			_l = 0
		break
	#endregion

	#region EXIT
		case 4:
			if !fading() {
				shop_dial(si,sh,tr($"e_sh{si}"))

				if !dial_exists() {
					var e = [a_index(global.curRoom),global.m_name[0]]
					global.m_name[2] = e[1]

					f = fade()
					f.m = e[0]
					f.nmus = e[1]
					f.X = global.X
					f.Y = global.Y
					f.F = global.F
				}
			}

			_l = 0
		break
	#endregion
}

if _l {
	if !dw {draw_rec(420 + jx,240,427 + jx,479,0,c_white)}
	else {d_b = 234}

	draw_col(c_white)

	var lb = [ $"{global.g[dw]}{go}",$"{item_amt()}/8"]
	for (var i = 0;i < 2;i++) {draw_txt(460 + (100 * i) + ((10 + (i * 2)) * j),428,lb[i])}
}
else {d_b = 0}

if _ex {
	draw_col(c_white)
	draw_txt(60,428,tr("Exit"))
}

if _g {
	draw_col(c_yellow)
	draw_txt(400,427 + j,$"({global.g[dw]}{go})")
}

if dial_exists() and !_l {a.finish = 1}
else if !dial_exists() {trigger[2] = 0}