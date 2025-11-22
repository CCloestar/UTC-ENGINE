function draw_spr(spr = sprite_index,img = image_index,xx = x + sprite_get_xoffset(spr),yy = y + sprite_get_yoffset(spr),xscale = image_xscale,yscale = image_yscale,rot = image_angle,col = image_blend,alpha = image_alpha){
	draw_sprite_ext(spr,img,xx,yy,xscale,yscale,rot,col,alpha)
}