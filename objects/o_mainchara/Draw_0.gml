#region STEPS CODE
	var pp,st,r_st,r_amt,b_rm,b_rms,b_currm
	
	pp = 0
	st = 0
	r_st = 80
	r_amt = 40
	b_rm = 0
	
	b_rms = [rm_hole0]
	
	switch global.area {
		default:
			st = global.story[100]
		break
	}

	if !st {
		if !r_step and array_contains(b_rms,room) {
			if rKills - st > 0 {
				pp = rKills / (rKills - st)
				if pp > 8 {pp = 8}
			
				r_step = (r_st + irandom_range(1,r_amt)) * pp
			}
			else {
				if global.kills[dw] < rKills or global.kills[dw] >= rKills {r_step = 20}
				else {r_step = (r_st + round(r_amt / 2)) * 5}

				if global.kills[dw] < rKills {global.kills[dw] = rKills}
			}
		}
	}
#endregion

draw_area()

if !enc[0] {
	if (step >= r_step and r_step) {enc[0] = 1}
}
else {
	char_stop()
	
	global.X = x
	global.Y = y
	global.F = f
	global.curRoom = room_get_name(room)

	var cautfr = 0
	
	if global.kills[dw] >= 99 {cautfr = global.curCh}

	draw_spr(caution,cautfr,x + 5,y - 9)
	
	if enc[1] {
		depth = globals.depth - 10000
		draw_set_color(c_black)
		draw_rectangle(-10,-10,room_width + 10,room_height + 10,0)
		
		if enc[1] < 2 {draw_self()}
	}
	
	switch enc[1] {
		case 0:
			h_xx = x + 5
			h_yy = y + 17
			h_x = h_xx
			h_y = h_yy
			
			if !enc_timer[0] {audio_play(alert_0)}
	
			enc_timer[0]++
	
			if enc_timer[0] >= irandom_range(15,20) {
				enc[1] = 1
				enc_timer[0] = 0
				
				music_set_volume(,0)
				music_pause()
			}
		break
		
		case 1:
			var e = 14
		
			if enc_timer[0] % 4 == 0 and enc_timer[0] < e {
				enc[2] = 1
				audio_play(battle_begin_0)
			}
			
			if enc_timer[0] % 4 == 2 {enc[2] = 0}
			
			enc_timer[0]++
			
			if enc_timer[0] >= e {
				enc[1] = 2
				enc_timer[0] = 0
				enc[2] = 1
				audio_play(battle_begin_1)
			}
		break
		
		case 2:
			var y_s = camera_get_view_y(view_camera[0]) + 223
			var x_s = camera_get_view_x(view_camera[0]) + 20
			
			if h_xx <= x_s {h_xx = x_s}
			else {h_xx += ((x_s - h_x) / 17)}
			
			if h_yy >= y_s {h_yy = y_s}
			else {h_yy += ((y_s - h_y) / 17)}

			if h_xx = x_s and h_yy = y_s {
				enc_timer[0]++

				if enc_timer[0] >= 4 {
					global.fplay = 1
					
					if !global.bstory {
						var amt = irandom(3)
						if global.kills[dw] > rKills - 3 {amt = irandom(rKills - global.kills[dw])}
						
						if !amt {amt = 1}
	
						global.enAmt = amt
						
						if global.kills[dw] >= rKills {global.bstory = -9}
					}

					room_goto(rm_battle)
				}
			}
		break
	}

	draw_spr(heart_menu,0,h_xx,h_yy,,,,global.color[0],enc[2])
}

if global.debug and display.d {
	draw_hitbox()

	draw_font(1)
	draw_txt_outline(x + sprite_width + sprite_xoffset,(y + sprite_yoffset),"Steps: " + string(step),c_white,c_black,1,1,0,0.5,0.5,,,,2)
	draw_txt_outline(x + sprite_width + sprite_xoffset,(y + sprite_yoffset) + 8,"R.Steps: " + string(r_step),c_white,c_black,1,1,0,0.5,0.5,,,,2)
}