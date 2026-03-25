function is_deck(){
	var deck = 0
	var js = json_parse(json_encode(os_get_info()))	
	if os_type = os_linux {deck = (string_copy(js.gl_renderer_string,1,19) = "AMD Custom GPU 0405")}

	return deck
}