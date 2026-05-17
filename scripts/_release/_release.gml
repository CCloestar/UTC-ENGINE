function _release(b = 1) {
	var g = gpad
	var c = g._gpad
	var t = touchpad
	var bt = 0
	
	if b > -1 {
		if key_released(global.bt[b,0]) or key_released(global.bt[b,1]) {bt = 1}
		if c > -1 {
			var _b = [gp_padd,gp_padl,gp_padu,gp_padr]
			if gp_released(c,_b[b]) {bt = 1}
		}
		
		if i_exists(t) and (t.m[b] or t.m[7]) and m_released(mb_left) {bt = 1}
	}
	else {
		if b = -4 {bt = (key_released(vk_f4) or (i_exists(t) and t.m[8] and m_released(mb_left)) or (c > -1 and gp_released(c,gp_start)))}
		else {
			if key_released(global.bt[abs(b) + 3,0]) or key_released(global.bt[abs(b) + 3,1]) {bt = 1}
			if c > -1 {
				if gp_released(c,g.bt[abs(b + 1)]) {bt = 1}
			}
		
			if i_exists(t) and t.m[abs(b) + 3] and m_released(mb_left) {bt = 1}
		}
	}

	return bt	
}

function d_released() {return _release(0)}
function l_released() {return _release(1)}
function u_released() {return _release(2)}
function r_released() {return _release(3)}

function z_released() {return _release(-1)}
function x_released() {return _release(-2)}
function c_released() {return _release(-3)}
function f4_released() {return _release(-4)}

function dir_released() {return (_release(0) or _release(1) or _release(2) or _release(3))}
function main_released() {return (_release(-1) or _release(-2) or _release(-3) or dir_released())}
function ord_released(k) {return key_released(ord(k))}

function any_released(){
	var g = gpad
	var con = g._gpad
	var bt = 0
	
	if key_released(vk_anykey) {bt = 1}
	if con > -1 {
		for (var i = gp_face1;i < gp_extra6;i++) {
			if gp_released(con,i) {bt = 1}
		}
	}

	return bt
}

function gp_any_released() {
	var c = gpad._gpad
	for (var i = gp_face1;i < gp_extra6;i++) {return gp_released(c,i)}
}