if drawroom or drawmus {
	if !global.inBattle {char_stop()}

	draw_set_alpha(1 - (0.3 * drawmus))

	draw_set_color(c_black)
	draw_rectangle(0,0,800,800,0)
	
	draw_set_alpha(1)
	
	draw_font(l_check())
	draw_set_color(c_white)
	draw_set_halign(fa_center)
	if drawroom {draw_txt(320,100,"WHERE WOULD YOU LIKE TO GO?")}
	if drawmus {
		draw_txt(320,100,"NAME YOUR TRACK")
		
		draw_txt(320,300,"Pitch: " +string(muspit) + " Volume: " +string(musvol) + " Loop: " +string(musloop))
	}
	draw_set_color(roomcolor)
	draw_txt(320,150,drawroomtxt)
	
	if invalidalpha > 0 {
		invalidtimer++
		
		if invalidtimer >= 20 {invalidalpha -= 0.3}
	}
	else {
		invalidalpha = 0
		invalidtimer = 0
	}
	
	if invalidname {
		draw_set_color(c_red)
		draw_txt_alpha(320,200,"THIS ROOM DOESN'T EXIST",invalidalpha * drawroom)
		draw_txt_alpha(320,200,"THIS SONG DOESN'T EXIST",invalidalpha * drawmus)
	}
	
	draw_set_halign(fa_left)
	
	var newroom = asset_get_index(drawroomtxt)

	if ord_hold("1") {muspit += (0.1 * u_pressed() - (0.1 * (d_pressed() * (muspit > 0))))}
	if ord_hold("2") {musvol += (0.1 * (u_pressed() * (musvol < 1))) - (0.1 * (d_pressed() * (musvol > 0)))}
	if ord_pressed("3") {musloop = !musloop}

	if any_pressed() {
		if keyboard_check_pressed(vk_enter) {
			if roomcolor = global.color[0] {
				if drawroom {
					rm_go(newroom,"no_sound")

					drawroom = 0
				}
				
				if drawmus {
					music_stop()
					music_play(drawroomtxt,musvol,muspit,musloop)
					
					drawmus = 0
					char_free()
				}
			}
			else {
				drawroomtxt = ""
				keyboard_lastchar = ""
				
				invalidname = 1
				invalidalpha = 1
			}
		}
		
		if (!fading() or !i_exists(white_fade)) {
			if !keyboard_check_pressed(vk_backspace) {drawroomtxt = drawroomtxt + keyboard_lastchar}
			else {drawroomtxt = ""}
		}

		keyboard_lastchar = ""
	}
	
	roomcolor = c_dkgray
	if (room_exists(asset_get_index(drawroomtxt)) and drawroom) or (file_exists(working_directory + drawroomtxt + ".ogg") and drawmus) {roomcolor = global.color[0]}
}

var quitTxt = text("Quitting")

switch global.gamemode {
	default:
		var q_dots = ""
		var sc = 2 - l_check()

		#region CONTROLS
			if vk_hold(vk_escape) {quit++}
			else {quit = 0}

			if quit >= 20 {game_end()}
		#endregion
			
		#region ANIMATION SETUP
			if quit {
				if quitAlp < 0.9 {quitAlp += 0.1}

				frame_adv++
					
				if frame_adv >= 30 {
					frame++
					frame_adv = 0
				}

				if frame % 3 == 0 {q_dots = ""}
				if frame % 3 == 1 {q_dots = "."}
				if frame % 3 == 2 {q_dots = ".."}
					
				if l_check() {
					if frame % 3 == 1 {q_dots = "…"}
					if frame % 3 == 2 {q_dots = "……"}
				}
			}
			else {
				quitAlp = 0
				frame = 0
			}
		#endregion
		
		draw_font(4)
		if l_check() {draw_font(1,2)}
		
		draw_txt_outline(2 + (4 * l_check()),2 + (3 * l_check()),string_upper(quitTxt) + q_dots,c_white,c_black,quitAlp,quitAlp,,sc,sc,,,,1)
	break
}