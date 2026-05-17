function _press(b = 1) {
	var g = gpad
	var c = g._gpad
	var t = touchpad
	var bt = 0
	
	if b > -1 {
		if key_pressed(global.bt[b,0]) or key_pressed(global.bt[b,1]) {bt = 1}
		if c > -1 {
			var _b = [gp_padd,gp_padl,gp_padu,gp_padr]
			if gp_pressed(c,_b[b]) {bt = 1}
		}
		
		if i_exists(t) and (t.m[b] or t.m[7]) and m_pressed(mb_left) {bt = 1}
	}
	else {
		if b = -4 {bt = (key_pressed(vk_f4) or (i_exists(t) and t.m[8] and m_pressed(mb_left)) or (c > -1 and gp_pressed(c,gp_start)))}
		else {
			if key_pressed(global.bt[abs(b) + 3,0]) or key_pressed(global.bt[abs(b) + 3,1]) {bt = 1}
			if c > -1 {
				if gp_pressed(c,g.bt[abs(b + 1)]) {bt = 1}
			}

			if i_exists(t) and t.m[abs(b) + 3] and m_pressed(mb_left) {bt = 1}
		}
	}

	return bt	
}

function d_pressed() {return _press(0)}
function l_pressed() {return _press(1)}
function u_pressed() {return _press(2)}
function r_pressed() {return _press(3)}

function z_pressed() {return _press(-1)}
function x_pressed() {return _press(-2)}
function c_pressed() {return _press(-3)}
function f4_pressed() {return _press(-4)}

function dir_pressed() {return (_press(0) or _press(1) or _press(2) or _press(3))}
function main_pressed() {return (_press(-1) or _press(-2) or _press(-3) or dir_pressed())}
function ord_pressed(k) {return key_pressed(ord(k))}

function any_pressed(){
	var g = gpad
	var con = g._gpad
	var bt = 0
	
	if key_pressed(vk_anykey) {bt = 1}
	if con > -1 {
		for (var i = gp_face1;i < gp_extra6;i++) {
			if gp_pressed(con,i) {bt = 1}
		}
	}

	return bt
}

function gp_any_pressed() {
	var c = gpad._gpad
	for (var i = gp_face1;i < gp_extra6;i++) {return gp_pressed(c,i)}
}