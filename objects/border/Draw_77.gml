var ww = window_get_width()
var hh = window_get_height()
var sw = surface_get_width(application_surface)
var sh = surface_get_height(application_surface)
var xx = floor((ww - sw * global.scrSC) / 2)
var yy = floor((hh - sh * global.scrSC) / 2)

gpu_set_blendmode_ext(bm_one,bm_zero)
draw_surface_ext(application_surface,xx,yy,global.scrSC,global.scrSC,0,c_white,1)
reset_bm()

display_set_gui_size(ww,hh)
display_set_gui_maximise(global.scrSC,global.scrSC,xx,yy)
