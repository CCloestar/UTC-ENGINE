function reset_bm() {
	gpu_set_alphatestenable(0)
	gpu_set_blendmode(bm_normal)
	gpu_set_fog(0,c_white,0,0)
	draw_set_alpha(1)
}