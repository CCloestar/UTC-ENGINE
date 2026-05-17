function is_mobile() {
	var m = 0

	if os_type = os_android or os_type = os_ios {m = 1}
	if i_exists(touchpad) and touchpad.debug {m = 1}

	var mo = os_get_info()

	if ds_map_find_value(mo,"mobile") {m = 1}
	ds_map_destroy(mo)

	return m
}

function is_web() {return ((os_browser != browser_not_a_browser) or (os_type = os_browser) or (os_type = os_gxgames))}

function is_deck(){
	var d = 0
	var js = json_parse(json_encode(os_get_info()))
	if os_type = os_linux {d = (strcopy(js.gl_renderer_string,1,19) = "AMD Custom GPU 0405")}

	return d
}