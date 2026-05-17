var ww = (sprite_width / 2)
var hh = (sprite_height / 2)

var xx = ww - lengthdir_x(ww,angle)
var yy = hh - lengthdir_y(hh,angle - 90)

xx -= hh - lengthdir_y(hh,angle) - hh
yy -= ww - lengthdir_x(ww,angle - 90) - ww

<<<<<<< HEAD
draw_spr(,,x + xx,y + yy,,angle,col[0],fading(1))
=======
if fading(1) {draw_spr(,,x + xx,y + yy,,,angle)}
>>>>>>> 1731812de1943c5c91ceee1a0fc43738ca29353e
