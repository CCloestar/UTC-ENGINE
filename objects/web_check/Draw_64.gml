draw_rec(-20,-20,660,490,,c_black)
var _t = (global.time % 30)

if _t < 20 {
	draw_font(1)
	draw_set_halign(fa_center)
	draw_set_valign(fa_middle)
	draw_txt_color(320,240,tr(is_mobile() ? "[TAP TO START]" : "[CLICK TO START]"))
	draw_set_halign(fa_left)
	draw_set_valign(fa_top)
}

if audio_system_is_available() and m_pressed(mb_any) {
	global.init = -(is_mobile())
	destroy()
	warp_check()
}