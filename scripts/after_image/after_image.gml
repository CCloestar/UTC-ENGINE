function after_image(bg_blend = 1,color2 = id.image_blend){
	_ef = i_create(xprevious,yprevious,depth,afterimage)
	_ef.sprite_index = sprite_index
	_ef.image_index = image_index
	_ef.image_yscale = id.image_yscale
	_ef.image_xscale = id.image_xscale
	_ef.bg_blend = bg_blend
	_ef.color2 = color2
}