if image_blend != c_red {
	image_index = abs(gravity) + irnd_r(5,25)
	image_angle = choose(1,2)
	image_blend = c_red
}

for (var i = 0;i < image_index;i++) {
	gpu_set_blendmode(bm_add)
	draw_rec(x,y,x + image_angle,y + ((image_angle + 1) * (i + (i + 1))),,merge_color(#DFDFFF,#FFEAA0,o_mainchara.h_x * 0.7),(1 / i) * 0.7)
}

if x + sprite_width < 0 or x >= room_width {destroy()}
gpu_set_blendmode(bm_normal)