if bg_blend = 1 {image_blend = #22B14C}
if bg_blend = 2 {
	image_blend = color2
	alphaspeed = 0.1
}

switch ef {
	case 1:
		gpu_set_blendmode(bm_add)
	break
}
reset_bm()

image_alpha -= alphaspeed
if image_alpha <= 0 {destroy()}