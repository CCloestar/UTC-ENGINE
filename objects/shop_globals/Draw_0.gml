var t = global.shop_id
var bg = $"s_bg_{str_l(global.soul_name)}_{t}"
var ww = room_width
var hh = room_height

draw_rec(-10,-10,ww + 10,hh + 10,,c_dkgray)

draw_col(c_white)
draw_set_halign(fa_center)
draw_font(1)
draw_txt(ww / 2,50,bg,1)
draw_set_halign(fa_left)