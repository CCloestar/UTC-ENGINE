if keyboard_check_pressed(vk_f4) {	
	window_set_fullscreen(!window_get_fullscreen())
	
	ini_open("config.ini")
		save_file(window_get_fullscreen(),"fScreen",,,"config.ini")
	ini_close()
}

var e = cur_b > max_b
var howf = 0
var ex = 0

var spr
for (var i = 0;i < 2;i++) {spr[i] = asset_get_index("bo_" + string_lower(global.soul_name) + "_" + string(i) + "_" + string(global.gamemode))}

if cur_b != 0 and window_get_fullscreen() {
	draw_spr(bo_simple,,-160,-30,0.5,0.5,,c_black,1)
	
	for (var i = 0;i < 2;i++) {	
		var _a = 1
		if i {_a = a}

		if img[i] < 0 {
			var fr
			fr[i] = 0
			
			switch window_get_height() {
				case 720:
				case 768:
				case 800:
				case 900:
					fr[i] = 1
				break
			}

			draw_spr(bo_simple,fr[i],-160,-30,0.5,0.5,,merge_color(c_white,c_black,img[i] = -2),_a)
			
			if window_get_height() = 768 {
				draw_set_color(merge_color(c_white,c_black,img[i] = -2))
				draw_set_alpha(1)
				draw_line(x + 799.5,y + 30,x + 799.5,y + 511.5)
				draw_line(x + 157.5,y + 512,x + 800,y + 512)
				draw_set_alpha(1)
			}
		}
		else {
			if img[i] = 0 and !e {
				draw_spr(fbo_0,img[i] - 1,-160,-30,0.5,0.5,,,_a)

				if fspr {
					draw_spr(fbo_1,fspr - 1,x + 867,y + 2,0.5,0.5)
					draw_spr(fbo_2,fspr - 1,x + 914.5,y + 182,0.5,0.5)
					draw_spr(fbo_3,fspr - 1,x + 47,y + 472,0.5,0.5)
					draw_spr(fbo_4,fspr - 1,x - 0.5,y + 162,0.5,0.5)
					draw_spr(fbo_5,fspr - 1,x + 894.5,y + 357,0.5,0.5)
					draw_spr(fbo_6,fspr - 1,x + 17,y + 342,0.5,0.5)
					draw_spr(fbo_8,fspr - 1,x + 104.5,y + 19.5,0.5,0.5)
					draw_spr(fbo_9,fspr - 1,x + 134.5,y + 247,0.5,0.5)
					draw_spr(fbo_10,fspr - 1,x + 792,y + 527,0.5,0.5)
				}
			}
			else {
				if sprite_exists(spr[e]) {
					var bs = 1
					if sprite_get_height(spr[e]) = 1080 {bs = 0.5}
					draw_spr(spr[e],img[i] - 1,-160,-30,bs,bs,,,_a)
				}
			}
		}
	}
}