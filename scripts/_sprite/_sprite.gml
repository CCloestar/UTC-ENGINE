#macro a_index asset_get_index
#macro spr_exists sprite_exists

function spr_del(spr) {
	if spr_exists(spr) {
		sprite_delete(spr)
		reload_memory()
	}
}

function spr_add(spr = "",img = 0,bg = 0,sm = 0,_x = 0,_y = 0) {
	var s = sprite_add(spr,img,bg,sm,_x,_y)
	reload_memory()
	return s
}

#macro spr_name sprite_get_name
#macro spr_num sprite_get_number

function spr_x(s = sprite_index) {return sprite_get_xoffset(s)}
function spr_y(s = sprite_index) {return sprite_get_yoffset(s)}
function spr_w(s = sprite_index) {return sprite_get_width(s)}
function spr_h(s = sprite_index) {return sprite_get_height(s)}

function draw_spr(spr = sprite_index,fr = image_index,_x = x + (!is_str(spr) ? spr_x(spr) : 0),_y = y + (!is_str(spr) ? spr_y(spr) : 0),sc = [image_xscale,image_yscale],an = image_angle,c = image_blend,al = image_alpha) {
	var sp = [spr,global.l_spr,0]
	var sca = is_array(sc) ? [sc[0],sc[1]] : [sc,sc]

	if !is_str(sp[0]) {
		sp[0] = spr_name(spr)
		sp[2] = 1
	}

	var fsp = [ $"{sp[0]}_{tr_l("lang")}",-1]

	switch sp[2] {
		case 0:
			if l_check() {fsp[0] = $"{sp[0]}_ja"}
			if l_check("US") {fsp[0] = $"{sp[0]}_en"}
	
			fsp[1] = global.l_sp[$ fsp[0]]
	
			if fsp[1] = undefined {
				fsp[1] = global.l_sp[$ $"{sp[0]}_en"]
				fsp[1] = (fsp[1] = undefined) ? global.l_sp[$ sp[0]] : fsp[1]
			}
	
			fsp[1] = fsp[1] ?? heart_main
		break
		
		case 1:
			fsp[1] = a_index(sp[0])
		break
	}
	
	return draw_sprite_ext(fsp[1],fr,_x,_y,sca[0],sca[1],an,c,al)
}

function draw_spr_o(s = 1,spr = sprite_index,fr = image_index,xx = x,yy = y,sc = [image_xscale,image_yscale],an = image_angle,colstyle = 0,c = image_blend,al = image_alpha,style = 0) {
	var sca = is_array(sc) ? [sc[0],sc[1]] : [sc,sc]
	
	switch colstyle {
		default:
			gpu_set_fog(1,c,0,1)
	
			draw_spr(spr,fr,xx - s,yy,[sca[0],sca[1]],an,c,al)
			draw_spr(spr,fr,xx + s,yy,[sca[0],sca[1]],an,c,al)
			draw_spr(spr,fr,xx,yy - s,[sca[0],sca[1]],an,c,al)
			draw_spr(spr,fr,xx,yy + s,[sca[0],sca[1]],an,c,al)

			draw_spr(spr,fr,xx - (s * style),yy - (s * style),[sca[0],sca[1]],an,c,al)
			draw_spr(spr,fr,xx + (s * style),yy + (s * style),[sca[0],sca[1]],an,c,al)
			draw_spr(spr,fr,xx + (s * style),yy - (s * style),[sca[0],sca[1]],an,c,al)
			draw_spr(spr,fr,xx - (s * style),yy + (s * style),[sca[0],sca[1]],an,c,al)
	
			reset_bm()
		break
		
		case 1:
			draw_spr(spr,fr,xx - s,yy,[sca[0],sca[1]],an,c,al)
			draw_spr(spr,fr,xx + s,yy,[sca[0],sca[1]],an,c,al)
			draw_spr(spr,fr,xx,yy - s,[sca[0],sca[1]],an,c,al)
			draw_spr(spr,fr,xx,yy + s,[sca[0],sca[1]],an,c,al)
		
			draw_spr(spr,fr,xx - (s * style),yy - (s * style),[sca[0],sca[1]],an,c,al)
			draw_spr(spr,fr,xx + (s * style),yy + (s * style),[sca[0],sca[1]],an,c,al)
			draw_spr(spr,fr,xx + (s * style),yy - (s * style),[sca[0],sca[1]],an,c,al)
			draw_spr(spr,fr,xx - (s * style),yy + (s * style),[sca[0],sca[1]],an,c,al)
		break
		
		case 2:
			draw_spr(spr,fr,xx + (s * style),yy,[sca[0],sca[1]],an,c,al)
			draw_spr(spr,fr,xx - (s * style),yy,[sca[0],sca[1]],an,c,al)
			draw_spr(spr,fr,xx,yy + (s * style),[sca[0],sca[1]],an,c,al)
			draw_spr(spr,fr,xx,yy - (s * style),[sca[0],sca[1]],an,c,al)
			draw_spr(spr,fr,xx + s,yy + s,[sca[0],sca[1]],an,c,al)
			draw_spr(spr,fr,xx - s,yy - s,[sca[0],sca[1]],an,c,al)
			draw_spr(spr,fr,xx - s,yy + s,[sca[0],sca[1]],an,c,al)
			draw_spr(spr,fr,xx + s,yy - s,[sca[0],sca[1]],an,c,al)
			draw_spr(spr,fr,xx - (s * style),yy - s,[sca[0],sca[1]],an,c,al)
			draw_spr(spr,fr,xx + (s * style),yy - s,[sca[0],sca[1]],an,c,al)
			draw_spr(spr,fr,xx - s,yy - (s * style),[sca[0],sca[1]],an,c,al)
			draw_spr(spr,fr,xx + s,yy - (s * style),[sca[0],sca[1]],an,c,al)
		break
	}

	draw_spr(spr,fr,xx,yy,[sca[0],sca[1]],an,draw_col(),draw_alp())
}

function draw_spr_s(scol = c_black){
	gpu_set_fog(1,scol,0,1)
	gpu_set_alphatestenable(1)
	draw_self()
	reset_bm()
}

#macro draw_spr_stretched draw_sprite_stretched
#macro draw_spr_stretched_ext draw_sprite_stretched_ext

function draw_spr_c(n = global.name[0]){
	var fspr
	
	for (var i = 0;i < 4;i++) {
		for (var o = 0;o < 3;o++) {
			var sprite,dsprite,ssprite,ch

			ch = $"{str_l(n)}_{i}"
			sprite = [ch,$"{ch}_r",$"{ch}_t"]

			if !spr_exists(a_index(sprite[0])) {sprite[0] = $"null_{i}"}

			if o {
				if !spr_exists(a_index(sprite[o])) {sprite[o] = sprite[0]}
			}

			dsprite[o] = $"d_{sprite[o]}"
			ssprite[o] = $"{sprite[o]}_{global.skin}"

			sprite[o] = a_index(sprite[o])

			if global.world and spr_exists(a_index(dsprite[o])) {sprite[o] = a_index(dsprite[o])}
			if global.skin and spr_exists(a_index(ssprite[o])) {sprite[o] = a_index(ssprite[o])}
		
			fspr[i,o] = sprite[o]
		}
	}

	if f > -1 {sprite_index = fspr[f,r]}
}

function draw_a(s = 1,x0 = 0,y0 = 0){
	if s {draw_spr(,,x + sprite_xoffset + x0,y + sprite_yoffset + y0)}

	var spx = 0
	var spy = 0
	
	var obj = object_get_name(object_index)

	switch obj {
		case "o_npc":
		case "o_follower":
		case "o_mainchara":
			spx = sprite_xoffset * 2
			spy = sprite_yoffset * 2
		break
		
		case "o_sign":
			y0 = -4
			spx = sprite_xoffset * 2
			spy = sprite_yoffset * 2
		break
		
		case "o_lever":
			spx = sprite_xoffset
			spy = sprite_yoffset
		break
	}
	
	var _sp = sprite_index
	var _ii = image_index
	var _xx = (x + spx) + x0
	var _yy = (y + spy) + y0
	var sc = [image_xscale,image_yscale]
	var sca = is_array(sc) ? [sc[0],sc[1]] : [sc,sc]
	var _an = image_angle
	var _col = image_blend
	var _al = image_alpha * visible

	switch global.area {
		#region WATER
			case 3:
				draw_spr(_sp,_ii,_xx,_yy,[sca[0],sca[1]],_an,c_black,_al * 0.2)

				gpu_set_blendmode_ext(bm_dest_color,bm_zero)
				gpu_set_fog(1,c_blue,0,1)
				gpu_set_alphatestenable(1)

				draw_spr(_sp,_ii,_xx,_yy,[sca[0],sca[1]],_an,_col,_al)

				reset_bm()
			break
		#endregion
	
		#region COLD WEATHER
			case 2.5:
				gpu_set_alphatestenable(1)
				draw_spr(_sp,_ii,_xx,_yy,[sca[0],sca[1]],_an,#101010,_al * 0.1)

				gpu_set_fog(1,#1F234B,0,1)
				gpu_set_blendmode(bm_max)
				draw_spr(_sp,_ii,_xx,_yy,[sca[0],sca[1]],_an,_col,_al * 0.8)
				gpu_set_blendmode(bm_add)
				draw_spr(_sp,_ii,_xx,_yy,[sca[0],sca[1]],_an,_col,_al * 0.2)
	
				reset_bm()
			break
		#endregion
	
		#region HOT WEATHER
			case 5:
				gpu_set_alphatestenable(1)
				draw_spr(_sp,_ii,_xx,_yy,[sca[0],sca[1]],_an,#251620,_al * 0.1)

				gpu_set_fog(1,#251620,0,1)
				gpu_set_blendmode(bm_max)
				draw_spr(_sp,_ii,_xx,_yy,[sca[0],sca[1]],_an,_col,_al * 0.8)
				gpu_set_blendmode(bm_add)
				draw_spr(_sp,_ii,_xx,_yy,[sca[0],sca[1]],_an,_col,_al * 0.2)
	
				reset_bm()
			break
		#endregion
	}
}

function draw_b(x1 = 0,y1 = 0,x2 = 0,y2 = 0,c = c_white,bgc = c_black,w = 6,o = 0,dw = 0,dw_t = 10){
	switch dw {
		default:
			draw_col(c)
			draw_rectangle(x1,y1,x2,y2,o)
			draw_col(bgc)
			draw_rectangle(x1 + w,y1 + w,x2 - w,y2 - w,o)
		break
		
		case 1:
			var d_x1,d_y1,d_x2,d_y2,ww,hh
		
			d_x1 = x1 - 8
			d_y1 = y1 - 8

			d_x2 = x2 + 8
			d_y2 = y2 + 8

			ww = (d_x2 - d_x1) + 1
			hh = (d_y2 - d_y1) + 1

			var dc = [c_white,#AAFFE6,#8CCEFF,#7191FF,#513EFF]
			var dt = floor(global.time / dw_t) % 8
			var fr = !global.simpleVFX ? ((dt > 4) ? (8 - dt) : dt) : 0
		
			draw_spr_stretched_ext(d_dw,0,d_x1,d_y1,ww,hh,c,1)
			draw_spr_stretched_ext(d_dw,1,d_x1,d_y1,ww,hh,dc[fr],1)
		break
	}
}