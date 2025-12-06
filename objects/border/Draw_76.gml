var ww = window_get_width()
var hh = window_get_height()
var sx = surface_get_width(application_surface)
var sy = surface_get_height(application_surface)
var scx = (ww / sx)
var scy = (hh / sy)

global.scrSC = floor(min(scx,scy)) + (0.5 * window_get_fullscreen())

var _d = display_get_width() / display_get_height()

if _d > 1.78 {global.scrSC = min(scx,scy)}
