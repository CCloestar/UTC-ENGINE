function cam_set_size(cam = view_camera[0],scx = 1,scy = 1,ch = 320,cw = 240){
	return camera_set_view_size(cam,ch * scx,cw * scy)
}