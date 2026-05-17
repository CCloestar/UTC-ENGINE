function parallax(lay = "passets",xx = 0,yy = 0,i = 1){
	if layer_exists(lay) {
		if string_char_at(lay,0) = "u" {layer_depth(lay,-9999 - i)}
		layer_x(lay, camera_get_view_x(view_camera[0]) * xx * i)
		layer_y(lay, camera_get_view_y(view_camera[0]) * yy * i)
	}
}