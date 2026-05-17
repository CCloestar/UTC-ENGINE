var c = o_mainchara
var fol = o_follower
var cam = o_camera
var _m = o_mover
var _p = o_warnobj
var _ffol = 0

timer[3] = round(timer[0] * 0.03)

switch trigger[0] {
	case 0:
		if place_meeting(x,y,c) and c.c != 1 {
			char_stop(,i_exists(fol))
			c._dep = 0
			fl_face()

			char_pos(x + 10,y - 21)
			cam_pos()

			if i_exists(fol) {
				_p = i_create(x + (fol.sprite_width / 4),y - (fol.sprite_height / 4),,o_warnobj)
				_p.visible = 0
				_m = i_move(o_follower,_p,20)
				fol.r = 1
				fol.image_index = 1
				fol.image_speed = 0.2
			}

			c.r = 1

			audio_play(squeak)

			trigger[0] = 1
			trigger[1] = c.f
		}
	break

	case 1:
		c.f = trigger[1]
		c.r = 1

		if i_exists(fol) {fol._alp = -2}

		if dir_pressed() and !(x_hold() or z_hold()) {
			if d_pressed() or u_pressed() {trigger[1] = 2 * u_pressed()}
			if l_pressed() or r_pressed() {trigger[1] = 1 + (2 * r_pressed())}

			if c.f != trigger[1] {
				trigger[0] = 1.5
				timer[0] = 0
				audio_play(poing,0,,0.3,,rnd_r(0.9,1.1))
			}
		}

		if x_pressed() and !z_hold() and !z_released() {
			audio_play(poing,,,0.6,,0.7)
			c.image_index = 1

			var f,col,r
			f = c.f
			col = [
				place_meeting(x,y + 25,c.rsolids),
				place_meeting(x - 25,y,c.rsolids),
				place_meeting(x,y - 25,c.rsolids),
				place_meeting(x + 25,y,c.rsolids)
			]

			switch f {
				case 3:
					if col[3] {f = 1}
					if col[3] and col[1] {f = 0}
					if col[3] and col[1] and col[0] {f = 2}
				break

				case 2:
					if col[2] {f = 1}
					if col[2] and col[1] {f = 0}
					if col[2] and col[1] and col[0] {f = 3}
				break

				case 1:
					if col[1] {f = 3}
					if col[1] and col[3] {f = 0}
					if col[1] and col[3] and col[0] {f = 2}
				break

				case 0:
					if col[0] {f = 2}
					if col[0] and col[2] {f = 1}
					if col[0] and col[2] and col[1] {f = 3}
				break
			}

			c.f = f

			if f = 1 {r = c.x - (19 * 2)}
			if f = 2 {r = c.y - 20}
			if f = 3 {r = c.x + (19 * 2)}
			if f = 0 {r = c.y + 32}

			trigger[0] = 2
			timer[2] = r
		}

		if z_hold() {
			timer[0] += 10
			char_pos(x + 10,(y - 21) + timer[3])

			if timer[0] >= 100 {
				timer[0] = 100

				if !timer[1] {
					audio_play(squeak,,,,,rnd_r(0.85,0.95))
					timer[1] = 1
				}
			}
		}

		if z_released() {
			if timer[0] >= 100 {
				audio_play(squeak,,,0.7,,rnd_r(0.65,0.75))
				audio_play(poing,,,0.6,,0.8)
				c.image_index = 1
			}
			else {audio_play(squeak,,,0.6,,0.6)}

			if c.f = 3 {timer[1] = c.x - (19 * (4 * (timer[0] / 100)))}
			if c.f = 2 {timer[1] = c.y - (16 * (9 * (timer[0] / 100)))}
			if c.f = 1 {timer[1] = c.x + (19 * (4 * (timer[0] / 100)))}
			if c.f = 0 {timer[1] = c.y + (24 * (4 * (timer[0] / 100)))}

			timer[2] = timer[0]
			timer[4] = c.f
			trigger[0] = 3
		}

		cam_pos()
	break
	
	#region SWITCHING SIDE
		case 1.5:
			c.y = y - (24 - timer[0])

			if !timer[0] {
				if trigger[1] = 0 and c.f = 2 {c.f = 3}
				if trigger[1] = 2 and c.f = 0 {c.f = 1}
				if (trigger[1] = 3 and c.f = 1) or (trigger[1] = 1 and c.f = 3) {c.f = 2}
			}

			timer[0]++

			if timer[0] >= 3 {
				c.y = y - 21
				cam_pos()
				timer[0] = 0
				trigger[0] = 1
			}
		break
	#endregion

	#region CANCEL
		case 2:
			timer[1]++

			timer[0] -= 20
			if !timer[0] {timer[0] = 0}

			var _f = 0

			switch c.f {
				case 0:
					c.image_speed = 0.14
					c.y += round(2 + (timer[1] * 0.38))

					if c.y >= timer[2] {_f = 1}
				break

				case 3:
					c.image_speed = 0.14
					c.y -= round(2 - (timer[1] * 0.38))
					c.x += round(3 - (timer[1] * 0.03))

					if c.x >= timer[2] {_f = 1}
				break

				case 1:
					c.image_speed = 0.14
					c.y -= round(2 - (timer[1] * 0.38))
					c.x -= round(3 - (timer[1] * 0.03))

					if c.x <= timer[2] {_f = 1}
				break

				case 2:
					c.image_speed = 0.2
					c.y -= round(4 - (timer[1] * 0.26))

					if c.y <= timer[2] {_f = 1}
				break
			}

			if _f {
				_ffol = 1
				timers_reset()
			}

			cam_pos()
		break
	#endregion
	
	#region ACTION
		case 3:
			timer[5]++

			timer[0] -= 40
			if !timer[0] {timer[0] = 0}

			var spin = 0

			if timer[2] < 100 {spin = 1}
			else {
				var f = timer[4]

				if f = 0 and place_meeting(x,y + round(ldir[0] * 19.1),c.rsolids) {f = -1}
				if f = 1 and place_meeting(x + round(ldir[1] * 35.2),y - 70,c.rsolids) {f = -1}
				if f = 2 and place_meeting(x,y - round(ldir[2] * 61.1),c.rsolids) {f = -1}
				if f = 3 and place_meeting(x - round(ldir[3] * 35.2),y - 70,c.rsolids) {f = -1}
				if f > -1 and !ldir[f] {f = -1}

				if f > -1 {
					c.r = 1
					c.image_speed = 0.05
					c.f = f

					c.y -= round(9 - (timer[5] * 0.38))

					var t = timer[5] * 0.03

					if f = 0 {c.y += round(ldir[0] - t)}
					if f = 1 {c.x -= round(ldir[1] - t)}
					if f = 2 {c.y -= round(ldir[2] - t)}
					if f = 3 {c.x += round(ldir[3] - t)}

					if timer[5] >= ldir_d[f] {
						timers_reset()
						_ffol = 1
					}					
				}
				else {spin = 1}
			}

			if spin {
				char_stop()

				if timer[5] % 2 == 0 {
					c.f--
					if c.f < 0 {c.f = 3}
				}

				c.y -= (5 - (timer[5] * 0.35)) * (timer[2] / 100)

				var yy = (y - 21) + timer[3]

				if c.y >= yy {
					c.y = yy
					c.f = timer[4]
					for (var i = 0;i < 6;i++) {timer[i] = 0}

					audio_play(squeak,,,0.6,,0.45)
					trigger[0] = 1
				}
			}

			cam_pos()
		break
	#endregion
}

if _ffol {
	with (c) {
		if place_meeting(x,y,g_boabouncy) {o_mainchara.c = 2}
		else {
			c._dep = 1
			char_free()
		}
	}

	if !c.c {
		if i_exists(fol) {
			var _xx = 16 * (2 - c.f) * (c.f % 2 == 1)
			var _yy = -8 * (1 - c.f) * (c.f % 2 == 0)

			fol.x = c.x + _xx
			fol.y = c.y + _yy
			fl_interpolate()
			fl_face()
			destroy(_m)
			destroy(_p)

			fol._alp = 2
		}
	}
}