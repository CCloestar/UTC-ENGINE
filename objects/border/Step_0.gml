var e = cur_b > max_b
var howf = 0
var ex = 0
var c = o_mainchara
var cuts = o_cutscene

var spr
<<<<<<< HEAD
for (var i = 0;i < 2;i++) {spr[i] = a_index($"bo_{str_l(global.soul_name)}_{i}_{global.gamemode}")}
=======
for (var i = 0;i < 2;i++) {spr[i] = asset_get_index("bo_" + string_lower(global.soul_name) + "_" + string(i) + "_" + string(global.gamemode))}
>>>>>>> 1731812de1943c5c91ceee1a0fc43738ca29353e

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

<<<<<<< HEAD
if f_exists(_c) {
	ini_open(_c)
		howf = load_real("f",howf,str_l(global.soul_name))
	ini_close()
}

=======
if file_exists(_c) {
	ini_open(_c)
		howf = ini_read_real(string_lower(global.soul_name),"f",howf)
	ini_close()
}

switch global.curCh {
	case 1:
	break
}

>>>>>>> 1731812de1943c5c91ceee1a0fc43738ca29353e
max_ex = max_b + ex

switch cur_b {
	case 1:
		img[0] = -1
		img[1] = img[0]
	break
<<<<<<< HEAD

=======
	
>>>>>>> 1731812de1943c5c91ceee1a0fc43738ca29353e
	case 2:
		img[0] = 0
		img[1] = img[0]
	break
<<<<<<< HEAD

=======
	
>>>>>>> 1731812de1943c5c91ceee1a0fc43738ca29353e
	case 3:
		if img[0] != img[1] {
			if a < 1 {a += force}
			else {
<<<<<<< HEAD
				timers_reset()
=======
				reset_timers()
>>>>>>> 1731812de1943c5c91ceee1a0fc43738ca29353e
				a = 0
				img[0] = img[1]
			}
		}
		else {a = 0}
<<<<<<< HEAD

		if a = 0 and img[0] = img[1] {
			/*
				img[0] = current image
				img[1] = next image
				img[i] = both images
				if img[0] isnt img[1], it will fade to img[1]!
				if img[i] is set, it will instantly change both.
			*/
			
=======
		
		if a = 0 and img[0] = img[1] {
>>>>>>> 1731812de1943c5c91ceee1a0fc43738ca29353e
			for (var i = 0; i < 2;i++) {
				switch room {
					default:
						img[1] = img[0]
					break
<<<<<<< HEAD

=======
					
>>>>>>> 1731812de1943c5c91ceee1a0fc43738ca29353e
					case rm_select:
					case rm_title:
						img[i] = -1
					break
<<<<<<< HEAD

=======
					
>>>>>>> 1731812de1943c5c91ceee1a0fc43738ca29353e
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
<<<<<<< HEAD

		if img[0] = img[1] {a = 0}

=======
		
		if img[0] = img[1] {a = 0}
		
>>>>>>> 1731812de1943c5c91ceee1a0fc43738ca29353e
		if global.debug and ord_hold("B") {
			if img[1] > -2 {img[1] -= l_pressed()}
			img[1] += r_pressed()
		}
	break
<<<<<<< HEAD

	default:
		img[0] = cur_b - 3

		if e {img[0] = cur_b - (3 + spr_num(spr[1]))}
=======
	
	default:
		img[0] = cur_b - 3

		if e {img[0] = cur_b - (3 + sprite_get_number(spr[1]))}
>>>>>>> 1731812de1943c5c91ceee1a0fc43738ca29353e
		img[1] = img[0]
	break
}

if cur_b > max_ex {cur_b = 0}