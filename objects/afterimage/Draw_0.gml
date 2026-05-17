if c = -10 {c = spr_num(spr) - 1}

if bg_blend = 1 {col[0] = #22B14C}
if bg_blend = 2 {
	col[0] = col[1]
	sp = 0.1
}

switch ef {
	case 1:
		gpu_set_blendmode(bm_add)
	break

	case 2:
		gpu_set_fog(1,col[0],0,1)
	break
}

if rev {
	image_index = c
	alp = image_alpha
	image_alpha = 0
	sp *= -1
	rev = 0
}

image_alpha -= sp
image_index = (1 - (image_alpha / 1)) * c

if image_alpha < 0 or image_alpha > 1 {destroy()}

draw_spr(spr,c,x,y,sc,,col[0],image_alpha * alp)
reset_bm()