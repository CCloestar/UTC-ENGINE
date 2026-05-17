function draw_spr_lang(spr = "",frame = image_index,xx = x,yy = y,xscale = image_xscale,yscale = image_yscale,rot = image_angle,col = image_blend,alpha = image_alpha){
	var f_spr = spr + "_" + string_lower(text("lang"))

	if l_check() {f_spr = spr + "_ja"}
	if l_check("US") {f_spr = spr + "_en"}
	
	var final = ds_map_find_value(global.l_spr,f_spr)
	
	if !ds_map_exists(global.l_spr,f_spr) {
		final = ds_map_find_value(global.l_spr,spr + "_en")
		
		if !ds_map_exists(global.l_spr,spr + "_en") {
			final = ds_map_find_value(global.l_spr,spr)
			
			if !ds_map_exists(global.l_spr,spr) {final = heart_main}
		}
	}

	if final != undefined {f_spr = final}
	else {f_spr = heart_main}

	return draw_spr(f_spr,frame,xx,yy,xscale,yscale,rot,col,alpha)
}