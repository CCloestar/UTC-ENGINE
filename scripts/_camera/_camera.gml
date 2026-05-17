function view_x(c = view_camera[0]) {return camera_get_view_x(c)}
function view_y(c = view_camera[0]) {return camera_get_view_y(c)}

function cam_width(c = view_camera[0]) {return camera_get_view_width(c)}
function cam_height(c = view_camera[0]) {return camera_get_view_height(c)}

function cam_pos(_x = o_mainchara.x + 10,_y = o_mainchara.y + 20){
	var c = o_camera

	c.x = _x
	c.y = _y
}

function cam_resize(c = view_camera[0],scx = 1,scy = 1,w = 320,h = 240) {return camera_set_view_size(c,w * scx,h * scy)}