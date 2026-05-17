function draw_txt(_x = 0,_y = 0,_s = "Err",sc = 2,an = 0,sep = -1,w = 9000) {
	var s = is_array(sc) ? [sc[0],sc[1]] : [sc,sc]

	return draw_text_ext_transformed(_x,_y,_s,sep,w,s[0],s[1],an)
}

function draw_txt_color(_x = 0,_y = 0,_s = "Err",sc = 2,an = 0,c = draw_col(),al = draw_alp(),sep = -1,w = 9000) {
	var _c = is_array(c) ? [c[0],c[1],c[2],c[3]] : [c,c,c,c]
	var s = is_array(sc) ? [sc[0],sc[1]] : [sc,sc]

	return draw_text_ext_transformed_color(_x,_y,_s,sep,w,s[0],s[1],an,_c[0],_c[1],_c[2],_c[3],al)
}

function draw_txt_him(_x = 0,_y = 0,_s = "Err",sc = 2,an = 0,c = draw_col(),himsin = 1,sep = -1,w = 9000) {
	var hal = (0.08 + sin(global.time / 14) * 0.04) * halp
	var _c = is_array(c) ? [c[0],c[1],c[2],c[3]] : [c,c,c,c]
	var s = is_array(sc) ? [sc[0],sc[1]] : [sc,sc]
	
	draw_txt_color(_x + s[0],_y + s[1],_s,[s[0],s[1]],an,[_c[0],_c[1],_c[2],_c[3]],hal,sep,w)
	draw_txt_color(_x - s[0],_y - s[1],_s,[s[0],s[1]],an,[_c[0],_c[1],_c[2],_c[3]],hal,sep,w)
	draw_txt_color(_x - s[0],_y + s[1],_s,[s[0],s[1]],an,[_c[0],_c[1],_c[2],_c[3]],hal,sep,w)
	draw_txt_color(_x + s[0],_y - s[1],_s,[s[0],s[1]],an,[_c[0],_c[1],_c[2],_c[3]],hal,sep,w)
	draw_txt_color(_x + s[0],_y,_s,[s[0],s[1]],an,[_c[0],_c[1],_c[2],_c[3]],hal,sep,w)
	draw_txt_color(_x - s[0],_y,_s,[s[0],s[1]],an,[_c[0],_c[1],_c[2],_c[3]],hal,sep,w)
	draw_txt_color(_x,_y + s[1],_s,[s[0],s[1]],an,[_c[0],_c[1],_c[2],_c[3]],hal,sep,w)
	draw_txt_color(_x,_y - s[1],_s,[s[0],s[1]],an,[_c[0],_c[1],_c[2],_c[3]],hal,sep,w)
	draw_txt_color(_x,_y,_s,[s[0],s[1]],an,[_c[0],_c[1],_c[2],_c[3]],1 * halp,sep,w)
}

function draw_txt_outline(_x = 0,_y = 0,_s = "Err",c = draw_col(),o_c = c_black,al = 1,o_al = 1,an = 0,sc = 2,st = 0,style = 0,sep = -1,w = 9000) {
	var s = is_array(sc) ? [sc[0],sc[1]] : [sc,sc]

	var ss = [(1 + st) * s[0],(1 + st) * s[1]]
	var _c = is_array(c) ? [c[0],c[1],c[2],c[3]] : [c,c,c,c]
	var _oc = is_array(o_c) ? [o_c[0],o_c[1],o_c[2],o_c[3]] : [o_c,o_c,o_c,o_c]

	switch style {
		case 0:
			draw_txt_color(_x - ss[0],_y + ss[1],_s,[s[0],s[1]],an,[_oc[0],_oc[1],_oc[2],_oc[3]],o_al,sep,w)
			draw_txt_color(_x + ss[0],_y - ss[1],_s,[s[0],s[1]],an,[_oc[0],_oc[1],_oc[2],_oc[3]],o_al,sep,w)
			draw_txt_color(_x - ss[0],_y - ss[1],_s,[s[0],s[1]],an,[_oc[0],_oc[1],_oc[2],_oc[3]],o_al,sep,w)
			draw_txt_color(_x + ss[0],_y + ss[1],_s,[s[0],s[1]],an,[_oc[0],_oc[1],_oc[2],_oc[3]],o_al,sep,w)

			draw_txt_color(_x + ss[0],_y,_s,[s[0],s[1]],an,[_oc[0],_oc[1],_oc[2],_oc[3]],o_al,sep,w)
			draw_txt_color(_x - ss[0],_y,_s,[s[0],s[1]],an,[_oc[0],_oc[1],_oc[2],_oc[3]],o_al,sep,w)
			draw_txt_color(_x,_y + ss[1],_s,[s[0],s[1]],an,[_oc[0],_oc[1],_oc[2],_oc[3]],o_al,sep,w)
			draw_txt_color(_x,_y - ss[1],_s,[s[0],s[1]],an,[_oc[0],_oc[1],_oc[2],_oc[3]],o_al,sep,w)
		break

		case 1:
			draw_txt_color(_x + ss[0],_y,_s,[s[0],s[1]],an,[_oc[0],_oc[1],_oc[2],_oc[3]],o_al,sep,w)
			draw_txt_color(_x - ss[0],_y,_s,[s[0],s[1]],an,[_oc[0],_oc[1],_oc[2],_oc[3]],o_al,sep,w)
			draw_txt_color(_x,_y + ss[1],_s,[s[0],s[1]],an,[_oc[0],_oc[1],_oc[2],_oc[3]],o_al,sep,w)
			draw_txt_color(_x,_y - ss[1],_s,[s[0],s[1]],an,[_oc[0],_oc[1],_oc[2],_oc[3]],o_al,sep,w)

			ss[0] -= floor(ss[0] * 0.5)
			ss[1] -= floor(ss[1] * 0.5)

			draw_txt_color(_x + ss[0],_y + ss[1],_s,[s[0],s[1]],an,[_oc[0],_oc[1],_oc[2],_oc[3]],o_al,sep,w)
			draw_txt_color(_x + ss[0],_y - ss[1],_s,[s[0],s[1]],an,[_oc[0],_oc[1],_oc[2],_oc[3]],o_al,sep,w)
			draw_txt_color(_x - ss[0],_y + ss[1],_s,[s[0],s[1]],an,[_oc[0],_oc[1],_oc[2],_oc[3]],o_al,sep,w)
			draw_txt_color(_x - ss[0],_y - ss[1],_s,[s[0],s[1]],an,[_oc[0],_oc[1],_oc[2],_oc[3]],o_al,sep,w)
		break

		case 2:
			draw_txt_color(_x + ss[0],_y + ss[1],_s,[s[0],s[1]],an,[_oc[0],_oc[1],_oc[2],_oc[3]],o_al,sep,w)
		break
		
		case 3:
			draw_txt_color(_x,_y + ss[1],_s,[s[0],s[1]],an,[_oc[0],_oc[1],_oc[2],_oc[3]],o_al,sep,w)
			draw_txt_color(_x,_y - ss[1],_s,[s[0],s[1]],an,[_oc[0],_oc[1],_oc[2],_oc[3]],o_al,sep,w)
			draw_txt_color(_x + ss[0],_y,_s,[s[0],s[1]],an,[_oc[0],_oc[1],_oc[2],_oc[3]],o_al,sep,w)
			draw_txt_color(_x - ss[0],_y,_s,[s[0],s[1]],an,[_oc[0],_oc[1],_oc[2],_oc[3]],o_al,sep,w)
		break
	}

	draw_txt_color(_x,_y,_s,[s[0],s[1]],an,[_c[0],_c[1],_c[2],_c[3]],al,sep,w)
}

function draw_name(name = global.pname,limit = 8,_tr = 1){
	var nam = name
	var ign = 0
	var igs = [""]

	if !global.changeName and nam = global.pname {nam = global.name[0]}
	var dots = "..."
	if l_check() {dots = "…"}
	if ar_contains(igs,nam) {ign = 1}
	if !global.changeName and _tr {nam = tr(nam)}

	if !ign {
		if strlen(nam) > limit {return strcopy(nam,1,limit) + dots}
		else {return nam}
	}
	else {return nam}
}

function draw_time(toRead = 0,hours = 0) {
	var tim,hrs,mins,secs,timstring,rmins,hs,ms,ss

	tim = toRead
	mins = floor(tim / 1800)
	rmins = mins % 60
	hrs = (mins - rmins) / 60
	secs = floor((tim / 30) - (mins * 60))

	hs = $"{hrs}:"
	ms = $"{mins}:"
	ss = str(floor(secs))
	
	if rmins < 10 {ms = $"0{ms}"}
	if secs < 10 {ss = $"0{ss}"}

	timstring = ms + ss
	if hours {timstring = hs + ms + ss}	
	return timstring
}

#macro is_str is_string
#macro str string
#macro str_u string_upper
#macro str_l string_lower	
#macro strlen string_length
#macro strwid string_width

#macro str_w string_width
#macro str_h string_height

#macro strdel string_delete
#macro strcopy string_copy
#macro strdigs string_digits
#macro strspl string_split

function strrep(s = "",sub,_n,_all = 0) {
	if _all {return string_replace_all(s,sub,_n)}
	return string_replace(s,sub,_n)
}

#macro strpos string_pos
#macro strchr string_char_at
#macro strord string_ord_at

function str_contains(s0 = "",s1 = "") {return strpos(str_l(s1),str_l(s0))}

function tr(txt = ""){
	if global.l_map[$ txt] = undefined {return txt}

	var tt = global.l_map[$ txt]

	for (var i = 0;i < argument_count;i++) {
		var a = argument[i] ?? ""
		
		if i {tt = strrep(tt,$"[{i - 1}]",str(a),1)}
	}

	return tt
}

function tr_u(txt = "") {
	var a = []
	for (var i = 0;i < argument_count;i++) {a[i] = argument[i]}
	
	return str_u(script_execute_ext(tr,a))
}

function tr_l(txt = "") {
	var a = []
	for (var i = 0;i < argument_count;i++) {a[i] = argument[i]}
	
	return str_l(script_execute_ext(tr,a))
}
	
function trlen(txt = "") {
	var a = []
	for (var i = 0;i < argument_count;i++) {a[i] = argument[i]}
	
	return strlen(script_execute_ext(tr,a))
}

function trwid(txt = "") {
	var a = []
	for (var i = 0;i < argument_count;i++) {a[i] = argument[i]}
	
	return strwid(script_execute_ext(tr,a))
}

function draw_font(fnt = 0,subfnt = -1){
	if fnt = -1 {
		var lf = global.gamemode
		if !font_exists(global.lfnt[lf]) {lf = 0}
		return draw_set_font(global.lfnt[lf])
	}

	if arlen(global.fnt) > fnt {
		if font_exists(global.fnt[fnt]) {return draw_set_font(global.fnt[fnt])}
	}
}