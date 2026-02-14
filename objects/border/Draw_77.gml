var ww = window_get_width()
var wh = window_get_height()

if !window_get_fullscreen() {
	ww = 640
	wh = 480
}

var sx = ww / 640
var sy = wh / 480

var sc = min(sx,sy)

var _ww = (ww - 640 * sc) / 2
var _wh = (wh - 480 * sc) / 2

if window_get_fullscreen() and cur_b != 0 {
	switch wh {
		default:
			ww = display_get_width()
			wh = display_get_height()
			
			sx = ww / 960
			sy = wh / 540
			sc = floor(min(sx,sy))
		break
		
		case 240:
			sc = 0.5
		break
		
		case 480:
			sc = 1
		break
		
		case 720:
		case 768:
		case 800:
		case 900:
			sc = 1.5
		break
		
		case 1080:
		case 1200:
			sc = 2
		break

		case 1440:
		case 1600:
			sc = 3
		break

		case 2160:
		case 2400:
			sc = 4
		break
	}

	_ww = (ww - 960 * sc) / 2 + 160 * sc
	_wh = (wh - 540 * sc) / 2 + 30 * sc
}

display_set_gui_maximise(sc,sc,_ww,_wh)

gpu_set_blendmode_ext(bm_one,bm_zero)
draw_surface_ext(application_surface,_ww,_wh,sc,sc,0,c_white,1)
reset_bm()