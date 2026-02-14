var e = cur_b > max_b
var howf = 0
var ex = 0
var c = o_mainchara
var cuts = o_cutscene

var spr
for (var i = 0;i < 2;i++) {spr[i] = asset_get_index("bo_" + string_lower(global.soul_name) + "_" + string(i) + "_" + string(global.gamemode))}

if img[0] = 0 and !e and a = 0 {
	if !(dir_hold() or z_hold() or x_hold() or c_hold()) {f++}
	else {f = 0}

	if f >= 300000 / (1 + (29999 * global.debug)) {
		ft++

		if ft % 3 == 0 {fspr++}
		if fspr > 2 {fspr = 0}
	}
}
else {f = 0}

if !f {
	ft = 0
	fspr = 0
}

var _c = global.soulfile

if file_exists(_c) {
	ini_open(_c)
		howf = ini_read_real(string_lower(global.soul_name),"howfar",howf)
	ini_close()
}

switch global.curCh {
	case 1:
		if howf > 0 {max_b = 4}
		if howf > 7 {max_b = 5}

		if global.story[100] {ex = 1}
	break
}

max_ex = max_b + ex

switch cur_b {
	case 2:
		img[0] = -1
		img[1] = img[0]
	break
	
	case 1:
		if img[0] != img[1] {
			if a < 1 {a += force}
			else {
				img[0] = img[1]
				a = 0
			}
		}
		else {a = 0}
		
		if a = 0 and img[0] = img[1] {
			for (var i = 0; i < 2;i++) {
				switch room {
					default:
						img[1] = img[0]
					break
					
					case rm_select:
					case rm_title:
						img[i] = -1
					break
					
					case rm_intro:
						if intro.s_alp > 0 {img[1] = -1}
						else {img[i] = 0}
					break

					case rm_hole0:
						img[i] = 1
					break
				}
			}
		}
		
		if img[0] = img[1] {a = 0}
		
		if global.debug and ord_hold("B") {
			if img[1] > -2 {img[1] -= l_pressed()}
			img[1] += r_pressed()
		}
	break
	
	default:
		img[0] = cur_b - 3

		if e {img[0] = cur_b - (3 + sprite_get_number(spr[1]))}
		img[1] = img[0]
	break
}

if cur_b > max_ex {cur_b = 0}