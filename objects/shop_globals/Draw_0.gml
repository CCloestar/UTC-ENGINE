var t = global.shop_id
var bg = "s_bg_" + string_lower(global.soul_name) + "_" + string(t)

draw_set_color(c_dkgray)
draw_rectangle(-10,-10,room_width + 10,room_height + 10,0)

draw_set_color(c_white)
draw_set_halign(fa_center)
draw_font(1)
draw_txt(room_width / 2,50,bg,1,1,0)
draw_set_halign(fa_left)