function draw_area(s = 1,x0 = 0,y0 = 0){
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
	var _xs = image_xscale
	var _ys = image_yscale
	var _an = image_angle
	var _col = image_blend
	var _al = image_alpha * visible

	switch global.area {
		case 1:
			gpu_set_fog(1,#4C2626,0,1)
			gpu_set_alphatestenable(1)
			
			draw_sprite_ext(_sp,_ii,_xx,_yy,_xs,_ys,_an,_col,_al * 0.25)
	
			reset_bm()
		break
		
		#region WATER
			case 3:
				draw_sprite_ext(_sp,_ii,_xx,_yy,_xs,_ys,_an,c_black,_al * 0.2)

				gpu_set_blendmode_ext(bm_dest_color,bm_zero)
				gpu_set_fog(1,c_blue,0,1)
				gpu_set_alphatestenable(1)

				draw_sprite_ext(_sp,_ii,_xx,_yy,_xs,_ys,_an,_col,_al)
	
				reset_bm()
			break
		#endregion
	
		#region COLD WEATHER
			case 2.5:
				gpu_set_alphatestenable(1)
				draw_sprite_ext(_sp,_ii,_xx,_yy,_xs,_ys,_an,#101010,_al * 0.1)

				gpu_set_fog(1,#1F234B,0,1)
				gpu_set_blendmode(bm_max)
				draw_sprite_ext(_sp,_ii,_xx,_yy,_xs,_ys,_an,_col,_al * 0.8)
				gpu_set_blendmode(bm_add)
				draw_sprite_ext(_sp,_ii,_xx,_yy,_xs,_ys,_an,_col,_al * 0.2)
	
				reset_bm()
			break
		#endregion
	
		#region HOT WEATHER
			case 5:
				gpu_set_alphatestenable(1)
				draw_sprite_ext(_sp,_ii,_xx,_yy,_xs,_ys,_an,#251620,_al * 0.1)

				gpu_set_fog(1,#251620,0,1)
				gpu_set_blendmode(bm_max)
				draw_sprite_ext(_sp,_ii,_xx,_yy,_xs,_ys,_an,_col,_al * 0.8)
				gpu_set_blendmode(bm_add)
				draw_sprite_ext(_sp,_ii,_xx,_yy,_xs,_ys,_an,_col,_al * 0.2)
	
				reset_bm()
			break
		#endregion
	}
}