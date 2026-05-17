#region STEPS CODE
<<<<<<< HEAD
	var pp,st,r_st,r_amt,b_rm

=======
	var pp,st,r_st,r_amt,b_rm,b_rms,b_currm
	
>>>>>>> 1731812de1943c5c91ceee1a0fc43738ca29353e
	pp = 0
	st = 0
	r_st = 80
	r_amt = 40
	b_rm = 0
<<<<<<< HEAD

	var a_s = {
		"0": [global.story[100],[rm_hole0]],
	}

	st = a_s[$ str(global.area)] ?? "0"

	if !st[0] {
		if !r_step and ar_contains(st[1],room) {
			if rKills - st[0] > 0 {
				pp = rKills / (rKills - st[0])
				if pp > 8 {pp = 8}

				r_step = (r_st + irnd_r(1,r_amt)) * pp
=======
	
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
>>>>>>> 1731812de1943c5c91ceee1a0fc43738ca29353e
			}
			else {
				if global.kills[dw] < rKills or global.kills[dw] >= rKills {r_step = 20}
				else {r_step = (r_st + round(r_amt / 2)) * 5}

				if global.kills[dw] < rKills {global.kills[dw] = rKills}
			}

			if global.battled and global.kills[dw] < rKills {
				r_step *= 3
				r_step += (global.kills[dw] - rKills)
			}
		}
	}
#endregion

<<<<<<< HEAD
draw_a()
=======
draw_area()
>>>>>>> 1731812de1943c5c91ceee1a0fc43738ca29353e

if !enc[0] {
	if (step >= r_step and r_step) {enc[0] = 1}
}
else {
	char_stop()
<<<<<<< HEAD

=======
	
>>>>>>> 1731812de1943c5c91ceee1a0fc43738ca29353e
	global.X = x
	global.Y = y
	global.F = f
	global.curRoom = room_get_name(room)

<<<<<<< HEAD
	draw_spr(caution,global.curCh * (global.kills[dw] >= 99),x + 5,y - 9)

	if enc[1] {
		_dep = 0
		depth = globals.depth - 10000
		draw_col(c_black)
		draw_rectangle(-10,-10,room_width + 10,room_height + 10,0)

		if enc[1] < 2 {draw_self()}
	}

=======
	var cautfr = 0
	
	if global.kills[dw] >= 99 {cautfr = global.curCh}

	draw_spr(caution,cautfr,x + 5,y - 9)
	
	if enc[1] {
		_dep = 0
		depth = globals.depth - 10000
		draw_set_color(c_black)
		draw_rectangle(-10,-10,room_width + 10,room_height + 10,0)
		
		if enc[1] < 2 {draw_self()}
	}
	
>>>>>>> 1731812de1943c5c91ceee1a0fc43738ca29353e
	switch enc[1] {
		case 0:
			h_xx = x + 5
			h_yy = y + 17
			h_x = h_xx
			h_y = h_yy
<<<<<<< HEAD

			if !enc_timer[0] {audio_play(alert_0)}
			enc_timer[0]++

			if enc_timer[0] >= irnd_r(15,20) {
				enc_timer[0] = 0
				enc[1] = 1

				music_vol(,0)
				music_pause()
			}
		break

		case 1:
			var e = 14

=======
			
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
		
>>>>>>> 1731812de1943c5c91ceee1a0fc43738ca29353e
			if enc_timer[0] % 4 == 0 and enc_timer[0] < e {
				enc[2] = 1
				audio_play(battle_begin_0)
			}
<<<<<<< HEAD

			if enc_timer[0] % 4 == 2 {enc[2] = 0}
			enc_timer[0]++

			if enc_timer[0] >= e {
				enc_timer[0] = 0
				enc[1] = 2
=======
			
			if enc_timer[0] % 4 == 2 {enc[2] = 0}
			
			enc_timer[0]++
			
			if enc_timer[0] >= e {
				enc[1] = 2
				enc_timer[0] = 0
>>>>>>> 1731812de1943c5c91ceee1a0fc43738ca29353e
				enc[2] = 1
				audio_play(battle_begin_1)
			}
		break
<<<<<<< HEAD

		case 2:
			var y_s = view_y(view_camera[0]) + 223
			var x_s = view_x(view_camera[0]) + 20

			if h_xx <= x_s {h_xx = x_s}
			else {h_xx += ((x_s - h_x) / 17)}

=======
		
		case 2:
			var y_s = camera_get_view_y(view_camera[0]) + 223
			var x_s = camera_get_view_x(view_camera[0]) + 20
			
			if h_xx <= x_s {h_xx = x_s}
			else {h_xx += ((x_s - h_x) / 17)}
			
>>>>>>> 1731812de1943c5c91ceee1a0fc43738ca29353e
			if h_yy >= y_s {h_yy = y_s}
			else {h_yy += ((y_s - h_y) / 17)}

			if h_xx = x_s and h_yy = y_s {
				enc_timer[0]++

				if enc_timer[0] >= 4 {
					global.fplay = 1
<<<<<<< HEAD

					if !global.bstory {
						var amt = irnd(3)
						if global.kills[dw] > rKills - 3 {amt = irnd(rKills - global.kills[dw])}
						if !amt {amt = 1}
						global.en_r = amt

=======
					
					if !global.bstory {
						var amt = irandom(3)
						if global.kills[dw] > rKills - 3 {amt = irandom(rKills - global.kills[dw])}
						
						if !amt {amt = 1}
	
						global.enAmt = amt
						
>>>>>>> 1731812de1943c5c91ceee1a0fc43738ca29353e
						if global.kills[dw] >= rKills {global.bstory = -9}
					}

					room_goto(rm_battle)
				}
			}
		break
	}

<<<<<<< HEAD
	draw_spr(heart_menu,0,h_xx,h_yy,,,global.color[0],enc[2])
}

if in_debug() {
	draw_hitbox()

	var o = [
		[x,y,depth],
		[o_camera.x,o_camera.y]
	]

	var db = [
		$"Pos: {o[0]}",
		$"Steps: {step}/{r_step}",
		$"o_camera Pos: {o[1]}"
	]

	draw_font(1)
	for (var i = 0;i < arlen(db);i++) {draw_txt_outline(x + sprite_width + sprite_xoffset,(y + sprite_yoffset) + (8 * i),db[i],c_white,c_black,1,1,0,0.5,,2)}
=======
	draw_spr(heart_menu,0,h_xx,h_yy,,,,global.color[0],enc[2])
}

if global.debug and display.d {
	draw_hitbox()

	var o
	o[0,0] = x
	o[0,1] = y
	o[0,2] = depth
	o[1,0] = o_camera.x
	o[1,1] = o_camera.y

	var db
	db[0] = "Pos: " + string(o[0])
	db[1] = "Steps: " + string(step)
	db[2] = "R.Steps: " + string(r_step)
	db[3] = "o_camera Pos: " + string(o[1])

	draw_font(1)
	
	for (var i = 0;i < array_length(db);i++) {draw_txt_outline(x + sprite_width + sprite_xoffset,(y + sprite_yoffset) + (8 * i),db[i],c_white,c_black,1,1,0,0.5,0.5,,,,2)}
>>>>>>> 1731812de1943c5c91ceee1a0fc43738ca29353e
}