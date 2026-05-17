function invert_color(col = draw_get_color()){
	var _opc
	_opc[0] = 255 - color_get_red(col)
	_opc[1] = 255 - color_get_green(col)
	_opc[2] = 255 - color_get_blue(col)
	
	if !_opc[0] {_opc[0] = 0}
	if !_opc[1] {_opc[1] = 0}
	if !_opc[2] {_opc[2] = 0}

	return make_color_rgb(_opc[0],_opc[1],_opc[2])
}