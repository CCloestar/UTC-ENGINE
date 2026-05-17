function soul_state(state = 0,hx = heart.x,hy = heart.y) {
	with (heart) {
		x = hx
		y = hy
		scene = state
	
		switch state {
			case -1:
				visible = 0
				soul_change(mode)
			break
		
			case 1:
			case 0:
				visible = 1
			break
		
			case 2:
				scene = 1
				visible = 1
			break
		}
	}
}
	
function soul_change(s = 0){
	with (heart) {
		mode = s
		angle = 0

		for (var i = 0;i < 5;i++) {
			s_timer[i] = 0
			s_trigger[i] = 0
		}

		destroy(greenShield)
	}
}

function level_up(){
	var lv = global.lv

	if lv = 1 {global.next = 10}
	if lv = 2 {global.next = 30}
	if lv = 3 {global.next = 70}
	if lv = 4 {global.next = 120}
	if lv = 5 {global.next = 200}
	if lv = 6 {global.next = 300}
	if lv = 7 {global.next = 500}
	if lv = 8 {global.next = 800}
	if lv = 9 {global.next = 1200}
	if lv = 10 {global.next = 1700}
	if lv = 11 {global.next = 2500}
	if lv = 12 {global.next = 3500}
	if lv = 13 {global.next = 5000}
	if lv = 14 {global.next = 7000}
	if lv = 15 {global.next = 10000}
	if lv = 16 {global.next = 15000}
	if lv = 17 {global.next = 25000}
	if lv = 18 {global.next = 50000}
	if lv = 19 {global.next = 99998}
	if lv = 20 {global.next = 99999}
	
	if object_get_name(object_index) = "battle_globals" {
		if global.xp >= global.next {
			global.lv++
			lv_up = 1
			audio_play(lv_plus,,,lv != global.lv)
		}
	}
}
	
function soul0_move() {
	soul_move()
	clamper()
}

function soul1_move() {
	switch s_trigger[0] {
		case 2:
		case 0:
			angle = 90 * s_trigger[0]
			s_timer[0] = 0

			soul_move(1)
			y += s_timer[1]

			if !s_trigger[1] {
				if !angle {
					if u_hold() {
						s_trigger[1] = 1
						s_timer[1] = -6
					}

					if y < board.d[1] - 15 {s_trigger[1] = 1}
					else {s_trigger[1] = 0}
				}
				else {
					if d_hold() {
						s_trigger[1] = 1
						s_timer[1] = 6
					}

					if y > board.u[1] {s_trigger[1] = 1}
					else {s_trigger[1] = 0}
				}
			}
			else {
				if !angle {
					if y < board.d[1] - 15 {
						if !u_hold() and s_timer[1] <= -1 {s_timer[1] = -1}

						if s_timer[1] > 0.1 and s_timer[1] < 8 {s_timer[1] += 0.6}
						if s_timer[1] > -1 and s_timer[1] <= 0.5 {s_timer[1] += 0.2}
						if s_timer[1] > -4 and s_timer[1] <= -1 {s_timer[1] += 0.5}
						if s_timer[1] <= -4 {s_timer[1] += 0.2}
					}
					else {
						y = board.d[1] - 15
						s_trigger[1] = 0
						s_timer[1] = 0
					}
				}
				else {
					if y > board.u[1] {
						if !d_hold() and s_timer[1] >= 1 {s_timer[1] = 1}
										
						if s_timer[1] < -0.5 and s_timer[1] > -8 {s_timer[1] -= 0.6}
						if s_timer[1] < 1 and s_timer[1] >= -0.5 {s_timer[1] -= 0.2}
						if s_timer[1] < 4 and s_timer[1] >= 1 {s_timer[1] -= 0.5}
						if s_timer[1] >= 4 {s_timer[1] -= 0.2}
					}
					else {
						y = board.u[1]
						s_trigger[1] = 0
						s_timer[1] = 0
					}
				}
			}
		break
					
		case 1:
		case 3:
			s_timer[1] = 0
						
			soul_move(2)
			x += s_timer[0]
					
			if s_trigger[0] = 1 {
				angle = 90
							
				if !s_trigger[1] {
					if l_hold() {
						s_trigger[1] = 1
						s_timer[0] = -6
					}
								
					if x < board.r[1] - 15 {s_trigger[1] = 1}
					else {s_trigger[1] = 0}
				}
				else {
					if x < board.r[1] - 15 {
						if !l_hold() and s_timer[0] <= -1 {s_timer[0] = -1}
									
						if s_timer[0] > 0.1 and s_timer[0] < 8 {s_timer[0] += 0.6}
						if s_timer[0] > -1 and s_timer[0] <= 0.5 {s_timer[0] += 0.2}
						if s_timer[0] > -4 and s_timer[0] <= -1 {s_timer[0] += 0.5}
						if s_timer[0] <= -4 {s_timer[0] += 0.2}
					}
					else {
						x = board.r[1] - 15
						s_trigger[1] = 0
						s_timer[0] = 0
					}
				}
			}
			else {
				angle = -90
							
				if !s_trigger[1] {
					if r_hold() {
						s_trigger[1] = 1
						s_timer[0] = 6
					}
								
					if x > board.l[1] {s_trigger[1] = 1}
					else {s_trigger[1] = 0}
				}
				else {
					if x > board.l[1] {
						if !r_hold() and s_timer[0] >= 1 {s_timer[0] = 1}
										
						if s_timer[0] < -0.5 and s_timer[0] > -8 {s_timer[0] -= 0.6}
						if s_timer[0] < 1 and s_timer[0] >= -0.5 {s_timer[0] -= 0.2}
						if s_timer[0] < 4 and s_timer[0] >= 1 {s_timer[0] -= 0.5}
						if s_timer[0] >= 4 {s_timer[0] -= 0.2}
					}
					else {
						x = board.l[1]
						s_trigger[1] = 0
						s_timer[0] = 0
					}
				}
			}
		break
	}
					
	clamper()
}
	
function soul2_move() {
	if !i_exists(greenShield) {i_create(x + 7,y + 7,depth + 1,greenShield)}
}

function soul3_move() {
	var bo = board
	var lines = ceil(bo.d[1] / bo.u[1])

	soul_move(1)

	with (bo) {
		draw_col(c_purple)
		for (var i = 0;i < ceil(d[1] / u[1]) + 1;i++) {draw_line(l[1] + 16,(u[1] + 25) + (40 * i),r[1] - 16,(u[1] + 25) + (40 * i))}
	}
				
	switch s_trigger[0] {
		case 0:
			if u_pressed() and y - 40 > bo.u[1] {
				s_trigger[0]--
				s_timer[0] = y - 40
			}
				
			if d_pressed() and y + 40 < bo.d[1] {
				s_trigger[0]++
				s_timer[0] = y + 40
			}
		break
					
		case -1:
			if y > s_timer[0] {y -= dsp + 6}
			else {
				y = s_timer[0]
				s_timer[0] = 0
				s_trigger[0] = 0
			}
		break
					
		case 1:
			if y < s_timer[0] {y += dsp + 6}
			else {
				y = s_timer[0]
				s_timer[0] = 0
				s_trigger[0] = 0
			}
		break
	}

	clamper(16,,-16)
}
	
function soul4_move() {
	soul_move()
	clamper()

	switch global.gamemode {
		default:
			s_timer[0]--
					
			if z_pressed() and !s_timer[0] {
				s_timer[0] = 14
				audio_play(heart_shot)
						
				shot = i_create(x + 2.6,y + 2,,heartsht)
				shot.image_blend = col[0]
				shot.image_yscale = 0
				shot.vspeed = -16
			}
		break
	}
}

function soul5_move() {
	if s_timer[0] >= 100 {s_timer[0] = 100}
	if !s_timer[0] {s_timer[0] = 0}
				
	switch s_trigger[0] {
		case 0:
			soul_move(,floor(dsp / (2 + (2 * x_hold()))))
						
			if z_hold() {s_timer[0]++}
			else {s_timer[0]--}
			if s_timer[0] > 100 {s_timer[0] = 100}

			if z_released() and s_timer[0] >= 50 {
				s_trigger[0] = 1
				s_timer[0] -= 25
				s_timer[1] = 0
				shake(0,round(s_timer[0] / 100) * 2,,1)
				audio_play(heart_break_0,,,,,0.9)
			}
		break
					
		case 1:
			inv = 10
			s_timer[0]--
						
			if !s_timer[0] {
				audio_play(heart_break_1,,,0.7,,0.8)

				repeat (3) {
					sh = i_create(,,depth - 2,shard)
					sh.image_blend = col[0]
				}

				inv = 0
				s_timer[0] = 0
				s_trigger[0] = 0
			}
		break
	}
				
	clamper()
}
	
function soul6_move() {
	var cval = 5
	s_timer[0]--
			
	if !s_trigger[0] {
		soul_move()
					
		if z_hold() and !s_timer[0] and dir_hold() {	
			audio_play(swing,,,,,rnd_r(1.1,1.3))
			inv = cval
			s_trigger[1] = 0
			s_trigger[0] = 1
		}
	}
	else {
		soul_move(,dsp * (3 * !x_hold()))					
		a_image(,,,,depth + 1,,,#CC3700,1,,0.1)

		var epic_bl = b_bl_parent
		var bravedmg = inv

		var cl = collision_line(x,y,x + sprite_width,y + sprite_height,epic_bl,0,1)
					
		if cl != noone and !s_trigger[1] {
			if inv >= floor(cval / 2) {audio_play(punch_1)}
			else {audio_play(punch_0)}
						
			with (cl) {hp -= bravedmg}
						
			global.tp += round(bravedmg * 0.9)
						
			s_trigger[1] = 1
		}
					
		if !bravedmg {
			s_trigger[0] = 0
			s_timer[0] = 5
		}
	}
				
	clamper()
}