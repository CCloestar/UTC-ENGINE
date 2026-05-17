var _c = o_mainchara
var cc = o_camera
var fol = o_follower
var drawrec = 0

var po,_p
_p = [g_1plant0,g_1plant1]
po = [x + 41,y + 88]

var mx = x + (sprite_width / 2)
var my = y + (sprite_height / 2)

switch trigger[0] {
	case 0:
		if interacted() {
			char_stop(,i_exists(fol))

			_c.image_speed = 0.2

			_p[0] = i_create(po[0],po[1],,g_1plant0)
			_p[0].visible = 0

			i_move(_c,_p[0],20)

			if i_exists(fol) {
				with (fol) {
					r = 1
					image_speed = 0.2
					fl_face()
				}

				_p[1] = i_create(po[0] - 30,po[1] + 10,,g_1plant1)
				_p[1].visible = 0

				i_move(fol,_p[1],20)
			}

			trigger[0] = 1
		}
	break

	case 1:
		if abs(_c.x - po[0]) <= 1 {_c.x = po[0]}
		if abs(_c.y - po[1]) <= 1 {_c.y = po[1]}
		if cc.x > mx {cc.x -= (cc.x - mx) / 5}
		if cc.x < mx {cc.x += (mx - cc.x) / 5}
		if cc.y > my {cc.y -= (cc.y - my) / 5}
		if cc.y < my {cc.y += (my - cc.y) / 5}

		if i_exists(fol) {
			if abs(fol.x - (po[0] - 30)) < 0.5 and abs(fol.y - (po[1] + 10)) < 0.5 {
				with (fol) {
					image_speed = 0
					image_index = 0
					r = 2
				}

				destroy(_p[1])
				fl_face(2)
			}
		}

		if abs(cc.x - mx) < 0.5 and abs(cc.y - my) < 0.5 {
			cam_pos(mx,my)
			destroy(_p[0])
			destroy(_p[1])
			char_stop()
			_c.f = 2
			trigger[0] = 2

			if !global.story[100] {
				d = dial_create()
				for (var i = 0;i < 2;i++) {d.m[i] = tr($"boaeng0_{i}")}
				d.play = 0
				d.pos = 2
				trigger[0] = 1.5

				global.story[100] = 1
			}
		}
	break

	case 1.5:
		if dial_exists() {
			if d.cur_m {
				_c.y = po[1] + 2
				_c.x = po[0] - 12
				_c.sprite_index = chopper_mel

				if !timer[1] {
					audio_play(squeak,,,0.8)
					timer[1] = 1
				}
			}
		}
		else {
			_c.x = po[0]
			_c.y = po[1] + 3
			_c.sprite_index = chopper_lpuz
			timer[1] = 0
			trigger[0] = 2
		}
	break

	case 2:	
		with (_c) {
			f = -1
			sprite_index = chopper_lpuz
		}

		_c.x = po[0]
		_c.y = po[1] + 3

		timer[1]--

		if dir_pressed() {
			audio_play(click,,,,,0.9)
			timer[1] = 5
		}

		var py = 0
		for (var i = 0;i < 3;i++) {
			if g >= 3 * i {py = i}
		}

		if r_pressed() {
			g++
			if g = 3 * (py + 1) {g -= 3}
		}

		if l_pressed() {
			g--
			if g < py {g += 3}
		}

		if u_pressed() {
			g -= 3
			if g < 0 {g += 9}
		}

		if d_pressed() {
			g += 3
			if g > 8 {g -= 9}
		}

		if z_pressed() {
			a[g] = !a[g]

			if g + 1 < 3 * (py + 1) {a[g + 1] = !a[g + 1]}
			if g - 1 >= 3 * py {a[g - 1] = !a[g - 1]}
			if g + 3 < 9 {a[g + 3] = !a[g + 3]}
			if g - 3 > -1 {a[g - 3] = !a[g - 3]}

			audio_play(battle_begin_0,,,0.5)
			timer[1] = 5
		}

		gcode = $"{a[0]}{a[1]}{a[2]}_{a[3]}{a[4]}{a[5]}_{a[6]}{a[7]}{a[8]}"

		drawrec = 1

		_c.image_index = (timer[1] > 0)

		if x_pressed() {
			drawrec = 0

			_c.f = 2
			_c.y = po[1] + 1
			_c.image_index = 0

			trigger[0] = 3

			for (var i = 0;i < arlen(a);i++) {a[i] = 0}
			audio_play(battle_begin_0,,,0.4,,0.85)
		}
	break

	case 3:
		cc.y += 3

		if place_meeting(x,y,_c) {
			with (_c) {
				y++
				image_speed = 0.2
			}
		}

		if i_exists(fol) {
			fol.c = 0
			fl_interpolate()
			fl_face(3)
		}

		if cc.y >= _c.y + 20 {
			cam_pos()
			_c.image_speed = 0
			_c.image_index = 0
			destroy(_p[0])
			destroy(_p[1])
			destroy(o_mover)

			char_free()
			trigger[0] = 0
		}
	break
}

var _y = 0
var _x = 0

for (var i = 0;i < 9;i++) {
	if _x >= 3 {
		_y++
		_x = 0
	}

	var xx = 20 * _x
	var yy = 20 * _y

	var ac = a[i] ? [ #8F6B5F,#4F3436] : [ #1C1414,c_black]
	draw_b((x + 22) + xx,(y + 27) + yy,(x + 39) + xx,(y + 44) + yy,ac[0],ac[1],1)

	_x++
}

t++

f += (t % 6 == 0) / (2 + global.simpleVFX)
if f > 3 {f = 0}

var l = [
	#FFE600,
	#E56E00,
	#8A0003,
	#E56E00
]

draw_self()
draw_spr(,1,,,,,l[round(f)])
draw_hitbox()

if drawrec {
	var _xx = 20 * g
	var _yy = 0

	if g >= 3 {
		_xx -= 60
		_yy += 20
	}
	if g >= 6 {
		_xx -= 60
		_yy += 20
	}

	timer[0]++
	if timer[0] >= 16 {timer[0] = 0}

	draw_spr(gpuz0_1,timer[0] < 8,x + 19 + _xx,y + 24 + _yy)

	if in_debug() {
		draw_set_color(c_white)
		draw_font(1)
		draw_txt(x,y - 20,$"{g}, {gcode}",1)
	}
}