var ww = (sprite_width / 2)
var hh = (sprite_height / 2)

var xx = ww - lengthdir_x(ww,angle)
var yy = hh - lengthdir_y(hh,angle - 90)

xx -= hh - lengthdir_y(hh,angle) - hh
yy -= ww - lengthdir_x(ww,angle - 90) - ww

if fading(1) {draw_spr(,,x + xx,y + yy,,,angle)}