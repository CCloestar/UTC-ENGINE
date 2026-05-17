function load_button_txts(){
	var lh = 32 + (4 * l_check())
	var ast = l_check() ? "＊" : "*"

	var scol = global.story[100] ? #FFBBD4 : c_yellow

	switch btID[curBt] {
		case 1:
		case 0:
			var n = ["","",""]

			for (var i = 0;i < enAmt;i++) {n[i] = tr(en[i].name[0])}
			for (var i = 0;i < enAmt;i++) {
				var c = 0
				var nf = -1
				var _n = []
				
				for (var o = 0;o < enAmt;o++) {
					if n[i] = n[o] {
						c++
						arpush(_n,o)
						
						if nf = -1 {nf = o}
					}
				}
					
				if c > 1 {
					for (var o = 0;o < arlen(_n);o++) {n[_n[o]] += $" {chr(65 + o)}"}
				}
			}

			for (var i = 0;i < enAmt;i++) {
				f[i] = dial_create(100,278 + (lh * i),depth - 10)
				f[i].preset = 1
				f[i].d_col = (en[i].spare * !en[i].dead) ? scol : c_white
				f[i].m = [en[i].dead ? "" : $"{ast} {n[i]}"]
			}
		break
		
		case 2:
			var pp,its
			
			switch global.fntf {
				default:
					pg = dial_create(388,342)
					pg.preset = 1
					pg.m = [tr("page",p + 1)]

					for (var i = 0;i < 4;i++) {
						pp[i,0] = 100 + (240 * (i % 2 == 1))
						pp[i,1] = 278 + (lh * (ceil((i + 1) / 2) - 1))
						var _i = global.item[i + (4 * p),(1 + tense) + (3 * dw)]
						its[i] = _i = "" ? "" : $"{ast} {tr(_i)}"

						it[i] = dial_create(pp[i,0],pp[i,1])
						it[i].preset = 1
						it[i].m = [its[i]]
					}
				break
				
				case 1:
					for (var i = 0;i < 3;i++) {
						var _i = global.item[i,3 * dw]
						its[i] = _i = "" ? "" : $"{ast} {tr(_i)}"
					
						it[i] = dial_create(94,278 + (lh * i))
						it[i].preset = 1
						it[i].x_sep = 17
						it[i].m = [its[i]]
					}
				break
			}
		break
		
		case 3:
			var _s = 0
			
			for (var i = 0;i < enAmt;i++) {
				if en[i].spare and !en[i].dead {_s = 1}
			}
		
			s = dial_create(100,278)
			s.preset = 1
			s.reset = 0
			s.d_col = _s ? scol : c_white
			s.y_sep = lh
			var fle = $"~W &&{tr("* Flee")}"
			s.m = [ $"{tr("* Spare")}{(canRun ? fle : "")}"]
		break
	}
}