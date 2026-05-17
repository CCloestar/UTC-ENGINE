draw_rec(317,178,336,197,,#ED1C24)

draw_font(-1)
draw_col(c_white)
draw_txt(48,167,tr("undeRtale"),1)
draw_col(global.color[0])
draw_txt(194,239,tr("CYAN"),1)

draw_set_halign(fa_center)
draw_col(c_white)
draw_font(1)
draw_txt(room_width,330,tr(txt))
draw_set_halign(fa_left)

draw_rec(0,0,700,700,,c_black,abs(image_alpha - 1))