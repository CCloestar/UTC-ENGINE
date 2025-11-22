var fpscol,_l,_d,_u,_r,_z,_x,_c,st

st = 4

fpscol = c_white
_l = c_gray
_d = c_gray
_u = c_gray
_r = c_gray
_z = c_gray
_x = c_gray
_c = c_gray

if ord_pressed("D") {d = !d}

if fps <= 15 {fpscol = c_red}

if l_hold() {_l = global.color[0]}
if d_hold() {_d = global.color[0]}
if u_hold() {_u = global.color[0]}
if r_hold() {_r = global.color[0]}
if z_hold() {_z = global.color[0]}
if x_hold() {_x = global.color[0]}
if c_hold() {_c = global.color[0]}

if global.debug and d {
	draw_font(l_check())
	
	draw_txt_outline(4,0 + st,"FPS: " + string(fps),fpscol,,,,,1,1,,,0)
	draw_txt_outline(4,16 + st,"CPU steps: " + string(fps_real),fpscol,,,,,1,1,,,0)

	draw_txt_outline(4,32 + st,"LEFT",_l,,,,,1,1,,,0)
	draw_txt_outline(44,32 + st,"DOWN",_d,,,,,1,1,,,0)
	draw_txt_outline(84,32 + st,"UP",_u,,,,,1,1,,,0)
	draw_txt_outline(108,32 + st,"RIGHT",_r,,,,,1,1,,,0)

	draw_txt_outline(4,48 + st,"Z",_z,,,,,1,1,,,0)
	draw_txt_outline(20,48 + st,"X",_x,,,,,1,1,,,0)
	draw_txt_outline(36,48 + st,"C",_c,,,,,1,1,,,0)

	draw_set_color(c_white)
	draw_txt_outline(4,64 + st,"LANGUAGE: " + string(global.lang),c_white,c_black,,,,1,1,,,0)
	draw_txt_outline(4,80 + st,"NOCLIP: " + string(global.noclip),c_white,c_black,,,,1,1,,,0)
	draw_txt_outline(4,96 + st,"CHAPTER: " + string(global.curCh) + " (" + string(global.world) + ")",c_white,c_black,,,,1,1,,,0)
	draw_set_halign(fa_right)
	
	var roomname = room_get_name(room)
	var curx = 0
	var cury = 0
	var curf = 0
	var cx = camera_get_view_x(view_camera[0])
	var cy = camera_get_view_y(view_camera[0])
	
	if global.inBattle {
		if i_exists(heart) {
			curx = heart.x
			cury = heart.y
		}
	}
	else {
		if i_exists(o_mainchara) {
			curx = o_mainchara.x
			cury = o_mainchara.y
			curf = o_mainchara.f
		}
	}
	
	draw_txt_outline(636,0 + st,roomname,c_white,c_black,,,,1,1,,,0)
	draw_txt_outline(636,16 + st,"X: " + string(curx),c_white,c_black,,,,1,1,,,0)
	draw_txt_outline(636,32 + st,"Y: " + string(cury),c_white,c_black,,,,1,1,,,0)
	draw_txt_outline(636,48 + st,"F: " + string(curf),c_white,c_black,!global.inBattle,!global.inBattle,,1,1,,,0)
	draw_txt_outline(636,64 + st,"Cam. X: " + string(cx),c_white,c_black,,,,1,1,,,0)
	draw_txt_outline(636,80 + st,"Cam. Y: " + string(cy),c_white,c_black,,,,1,1,,,0)
	draw_txt_outline(636,467,global.m_name,c_white,c_black,,,,1,1,,,0)

	draw_set_halign(fa_left)
}

if global.inBeta {
	var betaTxt = "THIS IS A PROTOTYPE! Things may change during development!"
	
	draw_font(l_check())
	draw_set_halign(fa_center)
	draw_txt_outline(320,4 + st,betaTxt,global.color[0],,,,,1,1,,,0)
	draw_set_halign(fa_left)
}