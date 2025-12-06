var ww = window_get_width()
var hh = window_get_height()

if !window_get_fullscreen() {
	ww = display_get_width()
	hh = display_get_height()
}

var xx = ww / 960
var yy = hh / 540
var sf = floor(min(xx,yy)) + (0.5 * window_get_fullscreen())

var wi = (ww - (960 * sf)) / 2 + (160 * sf)
var he = (hh - (540 * sf)) / 2 + (30 * sf)

if cur_b = 0 {
	xx = ww / 640
	yy = hh / 480
	sf = min(xx,yy)

	wi = (ww - (640 * sf)) / 2
	he = (hh - (480 * sf)) / 2
}

gpu_set_blendmode_ext(bm_one,bm_zero)
draw_surface_ext(application_surface,wi,he,sf * global.scrSC,sf * global.scrSC,0,c_white,1)
reset_bm()

display_set_gui_size(ww,hh)
display_set_gui_maximise(sf,sf,wi,he)
