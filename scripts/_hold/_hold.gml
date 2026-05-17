function _hold(b = 1) {
	var g = gpad
	var c = g._gpad
	var t = touchpad
	var bt = 0
	
	if b > -1 {
		if key_hold(global.bt[b,0]) or key_hold(global.bt[b,1]) {bt = 1}
		if c > -1 {
			var _b = [gp_padd,gp_padl,gp_padu,gp_padr]
			var _a = [gp_axislv,gp_axislh]
			var ch = g.dch

			if ch != 1 and gp_hold(c,_b[b]) {bt = 1}
			if !(b % 4 == 0) {
				if ch != 2 and gp_axis(c,_a[0]) > (0.5 + g.sens[2]) * os_type = os_linux {bt = 1}
			}
			else {
				if ch != 2 and gp_axis(c,_a[1]) < (0.5 + g.sens[2]) * os_type = os_linux {bt = 1}
			}
		}
		
		if i_exists(t) and (t.m[b] or t.m[7]) and m_hold(mb_left) {bt = 1}
	}
	else {
		if b = -4 {bt = (key_hold(vk_f4) or (i_exists(t) and t.m[8] and m_hold(mb_left)) or (c > -1 and gp_hold(c,gp_start)))}
		else {
			if key_hold(global.bt[abs(b) + 3,0]) or key_hold(global.bt[abs(b) + 3,1]) {bt = 1}
			if c > -1 {
				if gp_hold(c,g.bt[abs(b + 1)]) {bt = 1}
			}
		
			if i_exists(t) and t.m[abs(b) + 3] and m_hold(mb_left) {bt = 1}
		}
	}

	return bt	
}

function d_hold() {return _hold(0)}
function l_hold() {return _hold(1)}
function u_hold() {return _hold(2)}
function r_hold() {return _hold(3)}

function z_hold() {return _hold(-1)}
function x_hold() {return _hold(-2)}
function c_hold() {return _hold(-3)}
function f4_hold() {return _hold(-4)}

function dir_hold() {return (_hold(0) or _hold(1) or _hold(2) or _hold(3))}
function main_hold() {return (_hold(-1) or _hold(-2) or _hold(-3) or dir_hold())}
function ord_hold(k) {return key_hold(ord(k))}

function any_hold(){
	var g = gpad
	var con = g._gpad
	var bt = 0
	
	if key_hold(vk_anykey) {bt = 1}
	if con > -1 {
		for (var i = gp_face1;i < gp_extra6;i++) {
			if gp_hold(con,i) {bt = 1}
		}
	}
	
	return bt
}

function gp_any_hold() {
	var c = gpad._gpad
	for (var i = gp_face1;i < gp_extra6;i++) {return gp_hold(c,i)}
}