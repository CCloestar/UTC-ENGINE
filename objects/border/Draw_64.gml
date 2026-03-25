if keyboard_check_pressed(vk_f4) or (on_controller() and gamepad_button_check_pressed(gpad._gpad,gp_select)) {	
	window_set_fullscreen(!window_get_fullscreen())
	
	ini_open("config.ini")
		save_file(window_get_fullscreen(),"fScreen",,,"config.ini")
	ini_close()
}

draw_spr(bo_simple,,-160,-30,0.5,0.5,,c_black,1)

var e = cur_b > max_b
var howf = 0
var ex = 0

var spr
for (var i = 0;i < 2;i++) {spr[i] = asset_get_index("bo_" + string_lower(global.soul_name) + "_" + string(i) + "_" + string(global.gamemode))}

if cur_b != 0 and window_get_fullscreen() {
	draw_spr(bo_simple,,-160,-30,0.5,0.5,,c_black,1)
	
	var bs = 1
	if sprite_get_height(spr[e]) = 1080 {bs = 0.5}
	
	var _f = 0

	if img[0] < img[1] {_f = 1}
	if img[0] > img[1] {_f = -1}

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
				if sprite_exists(spr[e]) {draw_spr(spr[e],img[i] - 1,-160,-30,bs,bs,,,_a)}
			}
		}
	}

	if global.debug and display.d {
		draw_font(1)
		draw_txt_outline(4,-14,string(img) + ", " + string(_f),c_white,,,,,1,1)
	}
}