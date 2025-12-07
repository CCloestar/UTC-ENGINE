var ww = window_get_width()
var wh = window_get_height()

var sx = ww / 640
var sy = wh / 480

var sc = min(sx,sy)

var _ww = (ww - 640 * sc) / 2
var _wh = (wh - 480 * sc) / 2

if window_get_fullscreen() and cur_b != 0 {
	ww = display_get_width()
	wh = display_get_height()
	
	sx = ww / 960
	sy = wh / 540

	sc = min(sx,sy) + 0.07

	_ww = (ww - 960 * sc) / 2 + 160 * sc
	_wh = (wh - 540 * sc) / 2 + 30 * sc
}

display_set_gui_maximise(sc,sc,_ww,_wh)

gpu_set_blendmode_ext(bm_one,bm_zero)
draw_surface_ext(application_surface,_ww,_wh,sc,sc,0,c_white,1)
reset_bm()
