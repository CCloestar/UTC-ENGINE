if start {
	var surf = surface_create(512,512)

	if !surface_exists(surf) {
		f_safe = 1
		start = 0
		buff = global.buff
	}
	else {
		surface_set_target(surf)
		draw_clear_alpha(c_black,0)
		draw_spr(,,sc * sprite_xoffset,sc * sprite_yoffset,sc,sc)
		surface_reset_target()
		
		var cb = global.buff
		buffer_get_surface(cb,surf,0)
		surface_free(surf)
		
		start = 0
		buff = cb
	}
	
	sw = floor(sprite_width * sc)
	sh = floor(sprite_height * sc)
}

if buff = -1 or finish {exit}

repeat (4) {
	if !f_safe {
		var cb = buff
		var _x = 0
		var lx = 0
		var ww = 0
		var w = sw
		var wid = (wd > 240) * wide
		buffer_seek(cb,buffer_seek_start,2048 * line)
		
		do {
			var c = buffer_read(cb,buffer_u32)
			
			if (c >> 24 and c & 255) {
				ww += (_x - lx) * 2
				lx = _x
				_x++
				
				while (_x < w) {
					c = buffer_read(cb,buffer_u32)
					
					if (c >> 24 and c & 255) {
						_x++
						continue
					}
					
					_x++
					break
				}
					
				var fl = _x - lx - 1
				
				if wid {
					d = i_create(x + ww,y + (line * 2),,b_duster)
					d.image_xscale = fl + 1
					ww += fl * 2
				}
				else {
					for (var i = 0;i < fl;i++) {
						i_create(x + ww,y + (line * 2) + 2,,b_duster)
						ww += 2
					}
				}
				
				lx = _x - 1
			}
			else {_x++}
		}
		until (_x >= w)
	}
	
	line++
	
	if line > sh {
		finish = 1
		exit
	}	
}