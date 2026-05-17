function draw_sprite_outline(s = 1,spr = sprite_index,frame = image_index,xx = x,yy = y,xscale = image_xscale,yscale = image_yscale,rot = image_angle,colstyle = 0,col = image_blend,alpha = image_alpha,style = 0) {
	switch colstyle {
		default:
			gpu_set_fog(1,col,0,1)
	
			draw_sprite_ext(spr,frame,xx - s,yy,xscale,yscale,rot,col,alpha)
			draw_sprite_ext(spr,frame,xx + s,yy,xscale,yscale,rot,col,alpha)
			draw_sprite_ext(spr,frame,xx,yy - s,xscale,yscale,rot,col,alpha)
			draw_sprite_ext(spr,frame,xx,yy + s,xscale,yscale,rot,col,alpha)

			draw_sprite_ext(spr,frame,xx - (s * style),yy - (s * style),xscale,yscale,rot,col,alpha)
			draw_sprite_ext(spr,frame,xx + (s * style),yy + (s * style),xscale,yscale,rot,col,alpha)
			draw_sprite_ext(spr,frame,xx + (s * style),yy - (s * style),xscale,yscale,rot,col,alpha)
			draw_sprite_ext(spr,frame,xx - (s * style),yy + (s * style),xscale,yscale,rot,col,alpha)
	
			reset_bm()
		break
		
		case 1:
			draw_sprite_ext(spr,frame,xx - s,yy,xscale,yscale,rot,col,alpha)
			draw_sprite_ext(spr,frame,xx + s,yy,xscale,yscale,rot,col,alpha)
			draw_sprite_ext(spr,frame,xx,yy - s,xscale,yscale,rot,col,alpha)
			draw_sprite_ext(spr,frame,xx,yy + s,xscale,yscale,rot,col,alpha)
		
			draw_sprite_ext(spr,frame,xx - (s * style),yy - (s * style),xscale,yscale,rot,col,alpha)
			draw_sprite_ext(spr,frame,xx + (s * style),yy + (s * style),xscale,yscale,rot,col,alpha)
			draw_sprite_ext(spr,frame,xx + (s * style),yy - (s * style),xscale,yscale,rot,col,alpha)
			draw_sprite_ext(spr,frame,xx - (s * style),yy + (s * style),xscale,yscale,rot,col,alpha)
		break
		
		case 2:
			draw_sprite_ext(spr,frame,xx + (s * style),yy,xscale,yscale,rot,col,alpha)
			draw_sprite_ext(spr,frame,xx - (s * style),yy,xscale,yscale,rot,col,alpha)
			draw_sprite_ext(spr,frame,xx,yy + (s * style),xscale,yscale,rot,col,alpha)
			draw_sprite_ext(spr,frame,xx,yy - (s * style),xscale,yscale,rot,col,alpha)
			draw_sprite_ext(spr,frame,xx + s,yy + s,xscale,yscale,rot,col,alpha)
			draw_sprite_ext(spr,frame,xx - s,yy - s,xscale,yscale,rot,col,alpha)
			draw_sprite_ext(spr,frame,xx - s,yy + s,xscale,yscale,rot,col,alpha)
			draw_sprite_ext(spr,frame,xx + s,yy - s,xscale,yscale,rot,col,alpha)
			draw_sprite_ext(spr,frame,xx - (s * style),yy - s,xscale,yscale,rot,col,alpha)
			draw_sprite_ext(spr,frame,xx + (s * style),yy - s,xscale,yscale,rot,col,alpha)
			draw_sprite_ext(spr,frame,xx - s,yy - (s * style),xscale,yscale,rot,col,alpha)
			draw_sprite_ext(spr,frame,xx + s,yy - (s * style),xscale,yscale,rot,col,alpha)
		break
	}

	draw_sprite_ext(spr,frame,xx,yy,xscale,yscale,rot,draw_get_color(),draw_get_alpha())
}