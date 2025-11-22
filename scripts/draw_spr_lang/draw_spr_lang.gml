function draw_spr_lang(spr = "",frame = image_index,xx = x,yy = y,xscale = image_xscale,yscale = image_yscale,rot = image_angle,col = image_blend,alpha = image_alpha){
	var f_spr = spr + "_" + string_lower(text("lang"))

	if l_check() {f_spr = spr + "_jp"}

	var final = asset_get_index(f_spr)
	
	if !sprite_exists(final) {final = asset_get_index(spr + "_us")}
	return draw_sprite_ext(final,frame,xx,yy,xscale,yscale,rot,col,alpha)
}