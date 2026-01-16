if keyboard_check_pressed(vk_f4) {	
	window_set_fullscreen(!window_get_fullscreen())
	
	ini_open("config.ini")
		save_file(window_get_fullscreen(),"fScreen",,,"config.ini")
	ini_close()
}

draw_set_color(c_black)
draw_rectangle(x,y,x + 159,y + 544,0)
draw_rectangle(x + 160,y,x + 960,y + 31,0)
draw_rectangle(x + 800,y + 32,x + 960,y + 544,0)
draw_rectangle(x + 160,y + 512,x + 799,y + 544,0)

var e = cur_b > max_b
var howf = 0
var ex = 0

var spr
for (var i = 0;i < 2;i++) {spr[i] = asset_get_index("bo_" + string_lower(global.soul_name) + "_" + string(i) + "_" + string(global.gamemode))}

if cur_b != 0 {
	for (var i = 0;i < 2;i++) {	
		var _a = 1
		if i {_a = a}
		
		if img[i] < 0 {
			var c
			c[i] = (img[i] = -1)
			
			draw_set_alpha(_a)
			draw_set_color(c_black)
			draw_rectangle(x,y,x + (159 - c[i]),y + 544,0)
			draw_rectangle(x + (159.5 - c[i]),y,x + 960,y + (31 - c[i]),0)
			draw_rectangle(x + (800 + c[i]),y + (32 - c[i]),x + 960,y + 544,0)
			draw_rectangle(x + (159.5 - c[i]),y + (512 + c[i]),x + (799 + c[i]),y + 544,0)
			
			if c[i] {
				draw_set_color(c_white)
				draw_rectangle(x + 159.5,y + 32,x + 799,y + 511,1)
			}
			
			draw_set_alpha(1)
		}
		else {
			if img[i] = 0 and !e {
				draw_spr(fbo_0,0,,,,,,,_a)
				
				if fspr {
					draw_spr(fbo_1,fspr - 1,x + 881,y - 1,image_xscale * 3,image_yscale * 3)
					draw_sprite(fbo_2,fspr - 1,x + 938,y + 200)
					draw_spr(fbo_3,fspr - 1,x + 58,y + 461,image_xscale * 3,image_yscale * 3)
					draw_sprite(fbo_4,fspr - 1,x,y + 89)
					draw_sprite(fbo_5,fspr - 1,x + 914,y + 410)
					draw_spr(fbo_6,fspr - 1,x + 19,y + 305,image_xscale * 3,image_yscale * 3)
				}
			}
			else {
				if sprite_exists(spr[e]) {draw_spr(spr[e],img[i] - 1,,,,,,,_a)}
			}
		}
	}
}
