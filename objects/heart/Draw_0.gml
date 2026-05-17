var bat = battle_globals
var bo = board

g_over()

if global.debug {
	if c_hold() {
		if l_pressed() {soul_change(mode - (1 * (mode > 0)))}
		if r_pressed() {soul_change(mode + 1)}
	}

	if ord_hold("G") and mode = 1 {
		if u_pressed() {s_trigger[0] = 2}
		if d_pressed() {s_trigger[0] = 0}
		if l_pressed() {s_trigger[0] = 3}
		if r_pressed() {s_trigger[0] = 1}
	}
}

#region DRAW STUFF
	var c = [
		r / 1.9921875 + (53 * ((g > b) * (r >= 100))),
		g / 1.9921875,
		b / 1.9921875 + (53 * ((b >= 100) * !((g > b) * (r >= 100))))
	]

	var mc = {
		"0": [make_rgb(global.color[0]),make_rgb(,[c[0],c[1],c[2]])],
		"1": [ #003CFF, #001D7F],
		"2": [ #00C000, #008000],
		"3": [ #D535D9, #8F1C93],
		"4": [c_yellow, #F4D400],
		"5": s_trigger[0] ? [ #D0FFFF,#D0FFFF] : [ #42FCFF,#00A6C5],
		"6": s_trigger[0] ? [merge_color(#FCA600,#FFE000,(inv / 10)),merge_color(#FCA600,#FFE000,(inv / 10))] : [ #FCA600, #EC6F00],
	}

	var cmc = mc[$ str(mode)] ?? "0"
	col = [cmc[0],cmc[1]]
	if mode = 4 {angle = 180}

	if inv {
		inv--

		if !s_trigger[2] {
			timer[0]++

			if timer[0] % 4 == 0 {image_blend = col[0]}
			if timer[0] % 4 == 2 {image_blend = col[1]}
		}
	}
	else {
		timer[0] = 0
		image_blend = col[0]
	}

	if !fading(1) {depth = bat.depth - 5}
#endregion

moving = (x != xprevious or y != yprevious)

switch scene {
	case -2:
		timer[1]++

		if timer[1] = 2 {
			timer[1] = 0
			frame[1]++

			if frame[1] > 1 {frame[1] = 0}
		}
	break

	case 1:
		var stop = 0

		if !stop {sp = (dsp - (2 * x_hold()))}
		else {sp = 0}

		if !w_tut {
			timer[2]++

			if frame[2] {
				if timer[2] >= 8 {
					draw_spr(arrow,0,x + 4,y + 42,,0,c_white)
					draw_spr(arrow,0,x + 2,y + 33,,-90,c_white)
					draw_spr(arrow,0,x + 11,y + 31,,180,c_white)
					draw_spr(arrow,0,x + 13,y + 40,,90,c_white)
				}

				if timer[2] >= 48 {timer[2] = 0}
			}
			else {
				if timer[2] >= 90 {
					frame[2] = 1
					timer[2] = 0
				}
			}

			if dir_hold() {
				w_tut = 1

				ini_open(global.soulfile)
					save_real(str_l(global.soul_name),"w",1)
				ini_close()
			}
		}

		var sm = $"soul{mode}_move"
		if scr_exists(sm) {scr_execute(sm)}
		else {scr_execute("soul0_move")}
	break
}

var ww = (sprite_width / 2)
var hh = (sprite_height / 2)

var xx = ww - lengthdir_x(ww,angle)
var yy = hh - lengthdir_y(hh,angle - 90)

xx -= hh - lengthdir_y(hh,angle) - hh
yy -= ww - lengthdir_x(ww,angle - 90) - ww

var xxx = x + xx
var yyy = y + yy

if mode = 5 and !s_trigger[0] {
	s_timer[1]++

	var sc = abs(sin(s_timer[1] / 8)) * (s_timer[0] / 80)

	gpu_set_blendmode(bm_add)
	draw_spr(,,xxx - sc * 8,yyy - sc * 8,[image_xscale + sc,image_yscale + sc],angle,#00A2E8,image_alpha * 0.5)
	reset_bm()
}

draw_spr(,,xxx,yyy,,angle)

if scene = -2 {
	draw_spr(heart_run,frame[1],x,y + 14)
	hspeed = -3
}

draw_hitbox()

if in_debug() {
	var dx = (x + sprite_width) + 10
	var sc = 1
	var spa = 16
	var dbg = [
		str(s_timer),
		str(s_trigger),
		$"MODE: {mode}",
		$"TP: {global.tp}"
	]

	draw_font(1)
	for (var i = 0;i < arlen(dbg);i++) {
		var hy = !i ? y : y + (16 * i - 1)
		draw_txt_outline(dx,hy,dbg[i],c_white,,,,,sc)
	}
}

function soul_move(axis = 0,sped = sp) {
	var mx = -l_hold() + r_hold()
	var my = -u_hold() + d_hold()

	var xs = mx * sped
	var ys = my * sped

	if axis != 2 {x += xs}
	if axis != 1 {y += ys}
}

function clamper(lx0 = 0,ly0 = 0,lx1 = 0,ly1 = 0) {
	if !global.noclip {
		x = clamp(x,(board.l[1]) + lx0,(board.r[1] - 15) + lx1)
		y = clamp(y,(board.u[1]) + ly0,(board.d[1] - 15) + ly1)
	}
}