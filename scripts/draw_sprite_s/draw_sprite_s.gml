function draw_sprite_s(scol = c_black){
	gpu_set_fog(1,scol,0,1)
	gpu_set_alphatestenable(1)
	draw_self()
	reset_bm()
}