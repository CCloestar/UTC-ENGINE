var t = global.shop_id
<<<<<<< HEAD
var bg = $"s_bg_{str_l(global.soul_name)}_{t}"
var ww = room_width
var hh = room_height

draw_rec(-10,-10,ww + 10,hh + 10,,c_dkgray)

draw_col(c_white)
draw_set_halign(fa_center)
draw_font(1)
draw_txt(ww / 2,50,bg,1)
=======
var bg = "s_bg_" + string_lower(global.soul_name) + "_" + string(t)

draw_set_color(c_dkgray)
draw_rectangle(-10,-10,room_width + 10,room_height + 10,0)

draw_set_color(c_white)
draw_set_halign(fa_center)
draw_font(1)
draw_txt(room_width / 2,50,bg,1,1,0)
>>>>>>> 1731812de1943c5c91ceee1a0fc43738ca29353e
draw_set_halign(fa_left)