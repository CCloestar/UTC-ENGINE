layercode()
draw_spr_c()
item_check()

var xx = (((x + 6) - view_x(view_camera[0])) / cam_width(view_camera[0])) * 640
var yy = (((y + 16) - view_y(view_camera[0])) / cam_height(view_camera[0])) * 480

g_over(xx,yy)

if !c {
	if global.debug and x_hold() {
		if ord_pressed("B") {i_create(x + 40,,,o_box)}
		if ord_pressed("S") {i_create(,y + 40,,o_save)}
		if ord_pressed("P") {
			var sp = choose("tk","tk")

			p = i_create(x - 40,y,,o_pickup)
			p.i = sp
		}

		var d_names = choose("Toriel","Null")

		if ord_hold("F") {
			if u_pressed() {fl_create(,,d_names)}
			if d_pressed() {fl_destroy()}
		}

		if ord_pressed("E") {enc[0] = 1}
	}

	var sp,col
	if !dir_hold() {w = 0}

	solids = [
		solid_parent,
		o_npc,
		o_save,
		o_sign,
		o_pickup,
		push_parent,
		o_cutscene,
		s_parent
	]

	stickysolids = [
		o_npc,
		o_box,
		o_save,
		o_sign,
		o_pickup,
		o_cutscene
	]

	ldramps = [o_ramp_ld]
	luramps = [o_ramp_lu]
	rdramps = [o_ramp_rd]
	ruramps = [o_ramp_ru]

	rsolids = [
		solid_parent,
		o_npc,
		o_save,
		o_sign,
		o_pickup,
		push_parent,
		o_cutscene,
		s_parent,
		o_ramp_ld,
		o_ramp_lu,
		o_ramp_rd,
		o_ramp_ru
	]

	if global.noclip {
		solids = [noone]
		stickysolids = [noone]
		ldramps = [noone]
		luramps = [noone]
		rdramps = [noone]
		ruramps = [noone]
		rsolids = [noone]
	}

	#region MOVEMENT CODE
		switch global.gamemode {
			#region UNDERTALE
				default:
					rsp = 0

					if global.canRun {
						var _r = 0

						if !global.autoRUN {_r = x_hold()}
						else {_r = w * !x_hold()}

						if _r {
							rsp = 1
							rt++

							if rt > 10 {rsp = 2}
							if rt > 60 {rsp = 3}
						}
						else {rt = 0}

						r = (rsp > 1)
					}

					sp = 3 + rsp

					col = [
						d_hold() * !u_hold(),
						l_hold(),
						u_hold(),
						r_hold() * !l_hold()
					]

					for (var i = 0;i < 4;i++) {
						if col[i] {
							c_colcheck(i,sp)
							c_staircheck(i,sp)
							c_rampcheck(i,sp)
						}
					}

					if l_hold() and x - xprevious < 0 and f = 3 {f = 1}
					if r_hold() and x - xprevious > 0 and f = 1 {f = 3}
					if u_hold() and y - yprevious < 0 and f = 0 {f = 2}
					if d_hold() and y - yprevious > 0 and f = 2 {f = 0}

					if !w {
						image_index = 0
						image_speed = 0
					}

					if ((l_hold() or r_hold()) and abs(xprevious - x) > 0)
					or ((u_hold() or d_hold()) and abs(yprevious - y) > 0) {
						step += 1 + rsp
						image_speed = (sp / 15)
					}
				break
			#endregion
		}

		if z_pressed() {
			var hitx = x + 2 + (7 * (f = 3)) - (15 * (f = 1))
			var hity = y + 23 - (21 * (f = 2))
			var spr = hitbox_v

			if f % 2 == 1 {spr = hitbox_h}

			hbox = i_create(hitx + (sprite_xoffset / 2),hity + (sprite_yoffset / 2),depth - 2,hitbox)
			with (hbox) {
				sprite_index = spr
				image_xscale = 0.5
				image_yscale = 0.5
			}
		}
	#endregion

	cam_pos()

	if c_pressed() {
		audio_play(click)
		char_stop()
		delay = 1
		inMenu = 1
	}
}

if enc[1] {
	depth = globals.depth - 10000
	_dep = 0
}

if _dep {depth = 1 - ((y * 10) + (sprite_height * 10))}

if _vol {
	_v += 0.2
	music_vol(,_v)

	if _v >= 1 {
		music_vol(,1)
		global.battled = 0
		_vol = 0
		_v = 0
	}
}

function c_colcheck(col = 0,_sp = 3) {
	var spa,turn,xAdd,yAdd

	spa = 1
	turn = 0

	xAdd = 0
	yAdd = 0

	switch global.gamemode {
		default:
			if l_hold() and x - xprevious < 0 and f = 3 {f = 1}
			if r_hold() and x - xprevious > 0 and f = 1 {f = 3}
			if u_hold() and y - yprevious < 0 and f = 0 {f = 2}
			if d_hold() and y - yprevious > 0 and f = 2 {f = 0}

			var s_spa = spa
			var sticky_x = ((l_hold() and place_meeting(x - s_spa,y,stickysolids)) or (r_hold() and place_meeting(x + s_spa,y,stickysolids)))
			var sticky_y = ((u_hold() and place_meeting(x,y - s_spa,stickysolids)) or (d_hold() and place_meeting(x,y + s_spa,stickysolids)))

			switch col {
				case 0:
					if !place_meeting(x,y + spa,solids) {
						if !place_meeting(x,y + _sp + spa,solids) {
							turn = 1

							y += _sp

							if !w {image_index = 1}
							w = 1

							if r_hold() and f = 3 {turn = 0}
							if l_hold() and f = 1 {turn = 0}
							if turn and !sticky_x {f = 0}
						}
						else {
							while (!place_meeting(x,y + yAdd + spa,solids)) {
								yAdd++
								y += yAdd
								yAdd = 0
							}
						}
					}
					else {
						if !sticky_y {
							if !(l_hold() or r_hold()) {
								f = 0
								w = 0
							}
							else {
								if l_hold() {f = 1}
								if r_hold() {f = 3}
								if r_hold() and l_hold() {f = 3}
							}

							if (l_hold() and place_meeting(x - spa,y - spa,solids))
							or (r_hold() and place_meeting(x + spa,y - spa,solids)) {
								w = 0
								image_index = 0
								image_speed = 0
							}
						}
						else {
							if f = 2 {f = 0}
							w = 0
							image_index = 0
							image_speed = 0
							x = xprevious

							if r_hold() {x -= _sp}
							if l_hold() {x += _sp}
							if d_hold() and !(l_hold() or r_hold()) {f = 0}
						}
					}
				break

				case 1:
					if !place_meeting(x - spa,y,solids) {
						if !place_meeting(x - _sp - spa,y,solids) {
							turn = 1
							
							x -= _sp - (xprevious = x + _sp)

							if !w {image_index = 1}
							w = 1

							if u_hold() and f = 2 {turn = 0}
							if d_hold() and f = 0 {turn = 0}
							if turn and !sticky_y {f = 1}
						}
						else {
							while (!place_meeting(x - xAdd - spa,y,solids)) {
								xAdd++
								x -= xAdd
								xAdd = 0
							}
						}
					}
					else {
						if !sticky_x {
							if !(u_hold() or d_hold()) {
								f = 1
								w = 0
							}
							else {
								if u_hold() {f = 2}
								if d_hold() and !u_hold() {f = 0}

								w = 1
							}
						}
						else {
							if f = 3 {f = 1}
							w = 0
							image_speed = 0
							image_index = 0
							y = yprevious

							if u_hold() {y += _sp}
							if l_hold() and !(u_hold() or d_hold()) {f = 1}
						}
					}
				break

				case 2:
					if !place_meeting(x,y - spa,solids) {
						if !place_meeting(x,y - _sp - spa,solids) {
							turn = 1
							dance = 0

							y -= _sp
							if !w {image_index = 1}
							w = 1

							if r_hold() and f = 3 {turn = 0}
							if l_hold() and f = 1 {turn = 0}
							if turn and !sticky_x {f = 2}
						}
						else {
							while (!place_meeting(x,y - yAdd - spa,solids)) {
								yAdd++
								y -= yAdd
								yAdd = 0
							}
						}
					}
					else {
						if !sticky_y {
							if !(l_hold() or r_hold()) {
								f = 2
								w = 0
							}
							else {
								if l_hold() {f = 1}
								if r_hold() {f = 3}
								if r_hold() and l_hold() {f = 1}
								w = 1
							}

							if d_hold() and !(r_hold() and place_meeting(x + spa,y,solids)) {
								if !dance {
									f = 0
									dance = 1
								}
								else {
									f = 2
									dance = 0
								}

								w = 1
								y += 3
							}

							if (l_hold() and place_meeting(x - spa,y + spa,solids))
							or (r_hold() and place_meeting(x + spa,y + spa,solids)) {
								w = 0
								image_index = 0
								image_speed = 0
							}
						}
						else {
							if f = 0 {f = 2}
							w = 0
							image_index = 0
							image_speed = 0
							x = xprevious
							if r_hold() {x -= _sp}
							if u_hold() and !(r_hold() or l_hold()) {f = 2}
						}
					}
				break

				case 3:
					if !place_meeting(x + spa,y,solids) {
						if !place_meeting(x + _sp + spa,y,solids) {
							turn = 1
							x += _sp - (xprevious = x - _sp)

							if !w {image_index = 1}
							w = 1

							if u_hold() and f = 2 {turn = 0}
							if d_hold() and f = 0 {turn = 0}
							if turn and !sticky_y {f = 3}
						}
						else {
							while (!place_meeting(x + xAdd + spa,y,solids)) {
								xAdd++
								x += xAdd
								xAdd = 0
							}
						}
					}
					else {
						if !(u_hold() or d_hold()) {
							f = 3
							w = 0
						}
						else {
							if !sticky_x {
								if u_hold() {f = 2}
								if d_hold() {f = 0}
								w = 1
							
								if d_hold() and u_hold() {
									f = 0
									w = 0
									image_speed = 0
									image_index = 0
									y = yprevious
								}
							}
							else {
								if f = 1 {f = 3}
								w = 0
								image_speed = 0
								image_index = 0
								y = yprevious

								if r_hold() and !(u_hold() or d_hold()) {f = 3}
							}
						}
					}
				break
			}

			if sticky_x {
				w = 0
				image_index = 0
				image_speed = 0
				y = yprevious
			}

			if sticky_y {
				w = 0
				image_index = 0
				image_speed = 0
				x = xprevious
			}
		break
	}
}

function c_rampcheck(col = 0,_sp = 3) {
	var lAdd,rAdd,uAdd,dAdd,ramp

	switch col {
		case 2:
		case 0:
			lAdd = 0
			rAdd = 0

			ramp = [ldramps,rdramps,luramps,ruramps]

			if place_meeting(x,y,ramp[col]) {
				if place_meeting(x - _sp,y,ramp[col]) {x += _sp}
				else {
					while(place_meeting(x - lAdd,y,ramp[col])) {
						lAdd++
						x += lAdd						
						lAdd = 0
					}
				}

				if l_hold() or r_hold() {
					image_index = 0
					w = 0
				}
			}

			if place_meeting(x,y,ramp[col + 1]) {
				if place_meeting(x + _sp,y,ramp[col + 1]) {x -= _sp}
				else {
					while(place_meeting(x + rAdd,y,ramp[col + 1])) {
						rAdd++
						x -= rAdd
						rAdd = 0
					}
				}

				if l_hold() or r_hold() {
					image_index = 0
					w = 0
				}
			}
		break

		case 3:
		case 1:
			uAdd = 0
			dAdd = 0

			ramp = [luramps,ldramps,ruramps,rdramps]

			if place_meeting(x,y,ramp[col]) {
				if place_meeting(x,y - _sp,ramp[col]) {y -= _sp}
				else {
					while(place_meeting(x,y - uAdd,ramp[col])) {
						uAdd++
						y -= uAdd
						uAdd = 0
					}
				}

				if u_hold() or d_hold() {
					image_index = 0
					w = 0
				}
			}

			if place_meeting(x,y,ramp[col - 1]) {
				if place_meeting(x,y + _sp,ramp[col - 1]) {y += _sp}
				else {
					while(place_meeting(x,y + dAdd,ramp[col - 1])) {
						dAdd++
						y += dAdd
						dAdd = 0
					}
				}

				if u_hold() or d_hold() {
					image_index = 0
					w = 0
				}
			}
		break
	}

	if (d_hold() and l_hold() and place_meeting(x,y + _sp,ramp[1])) or (d_hold() and r_hold() and place_meeting(x,y + _sp,ramp[3]))
	or (u_hold() and l_hold() and place_meeting(x,y - _sp,ramp[1])) or (u_hold() and r_hold() and place_meeting(x,y - _sp,ramp[3])) {
		image_index = 0
		image_speed = 0
		w = 0
	}
}

function c_staircheck(col = 0,_sp = 3) {
	var st = o_stairs

	if col % 2 == 1 and !(u_hold() or d_hold()) {
		var _s = _sp * (2 - col)
		var _add = [0,0]

		var _sta = instance_place(x,y,st)
		if _sta {
			var _staa = instance_place(x + _s,y,st)

			if _staa {
				y += (_s * (1 - (2 * (_staa.image_xscale < 0))))

				var dAdd = 0
				var uAdd = 0

				if place_meeting(x,y + _sp,solids) {
					while(place_meeting(x,y + dAdd,solids)) {
						dAdd++
						y -= dAdd
						dAdd = 0
					}
				}

				if place_meeting(x,y - _sp,solids) {
					while(place_meeting(x,y - uAdd,solids)) {
						uAdd++
						y += uAdd
						uAdd = 0
					}
				}

				c_rampcheck(col,_s)
			}
		}
	}
}