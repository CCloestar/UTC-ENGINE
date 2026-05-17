function draw_alp(a = "") {
	if is_str(a) {return draw_get_alpha()}
	else {return draw_set_alpha(a)}
}

function draw_rec(x1,y1,x2,y2,o = 0,c = draw_col(),a = "") {
	var _c = is_array(c) ? [c[0],c[1],c[2],c[3]] : [c,c,c,c]

	draw_alp(a)
	draw_rectangle_color(x1,y1,x2,y2,_c[0],_c[1],_c[2],_c[3],o)
	draw_alp(1)
}

function draw_cir(_x,_y,r,o = 0,c = draw_col(),a = "") {
	var _c = is_array(c) ? [c[0],c[1]] : [c,c]
	
	draw_alp(a)
	draw_circle_color(_x,_y,r,_c[0],_c[1],o)
	draw_alp(1)
}

function draw_tri(x1,y1,x2,y2,x3,y3,o = 0,c = draw_col(),a = "") {
	var _c = is_array(c) ? [c[0],c[1],c[2]] : [c,c,c]
	
	draw_alp(a)
	draw_triangle_color(x1,y1,x2,y2,x3,y3,_c[0],_c[1],_c[2],o)
	draw_alp(1)
}

function draw_ar(x1,y1,x2,y2,s,c = draw_col(),a = "") {
	draw_alp(a)
	draw_col(c)
	draw_arrow(x1,y1,x2,y2,s)
	draw_alp(1)
}

function draw_but(x1,y1,x2,y2,up,c = draw_col(),a = "") {
	draw_alp(a)
	draw_col(c)
	draw_button(x1,y1,x2,y2,up)
	draw_alp(1)
}