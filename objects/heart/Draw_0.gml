var bat = battle_globals
var bo = board

gameoverer()

if global.debug {
	if c_hold() {
		if l_pressed() {soul_change(mode - (1 * (mode > 0)))}
		if r_pressed() {soul_change(mode + 1)}
	}
	
	if ord_hold("G") and mode = 1 {
		if u_pressed() {s_trigger[0] = 2}
		if d_pressed() {s_trigger[0] = 0}
		if l_pressed() {s_trigger[0] = 3}
		if r_pressed() {s_trigger[0] = 1}
	}
}

#region DRAW STUFF
	r = color_get_red(global.color[0])
	g = color_get_green(global.color[0])
	b = color_get_blue(global.color[0])

	var rval = r / 1.9921875 + (53 * ((g > b) * (r >= 100)))
	var gval = g / 1.9921875
	var bval = b / 1.9921875 + (53 * ((b >= 100) * !((g > b) * (r >= 100))))

	dcol = make_color_rgb(r,g,b)
	hcol = make_color_rgb(rval,gval,bval)
	
	#region SOUL MODES COLORS	
		switch mode {
			case 1:
				dcol = #003CFF
				hcol = #001D7F
			break
		
			case 2:
				dcol = #00C000
				hcol = #008000
			break
	
			case 3:
				dcol = #D535D9
				hcol = #8F1C93
			break
	
			case 4:
				dcol = c_yellow
				hcol = #F4D400
			
				switch global.gamemode {
					default:
						angle = 180
					break
				}
			break
	
			case 5:
				if !s_trigger[0] {
					dcol = #42FCFF
					hcol = #00A6C5
				}
				else {
					dcol = #D0FFFF
					hcol = #D0FFFF
				}
			break
	
			case 6:
				if !s_trigger[0] {
					dcol = #FCA600
					hcol = #EC6F00
				}
				else {
					dcol = merge_color(#FCA600,#FFE000,(inv / 10))
					hcol = merge_color(#FCA600,#FFE000,(inv / 10))
				}
			break
		}
	#endregion

	if inv {
		inv--
	
		if !s_trigger[2] {
			timer[0]++
		
			if timer[0] % 4 == 0 {image_blend = dcol}
			if timer[0] % 4 == 2 {image_blend = hcol}
		}
	}
	else {
		timer[0] = 0
		image_blend = dcol
	}
	
	if !fading(1) {depth = bat.depth - 5}
#endregion

moving = (x != xprevious or y != yprevious)

switch scene {
	case -2:
		timer[1]++
		
		if timer[1] = 2 {
			timer[1] = 0
			frame[1]++
			
			if frame[1] > 1 {frame[1] = 0}
		}
	break

	case 1:
		var stop = 0

		if !stop {sp = (dsp - (2 * x_hold()))}
		else {sp = 0}

		if !w_tut {
			timer[2]++

			if frame[2] {
				if timer[2] >= 8 {
					draw_sprite_ext(arrow,0,x + 4,y + 42,1,1,0,c_white,1)
					draw_sprite_ext(arrow,0,x + 2,y + 33,1,1,-90,c_white,1)
					draw_sprite_ext(arrow,0,x + 11,y + 31,1,1,180,c_white,1)
					draw_sprite_ext(arrow,0,x + 13,y + 40,1,1,90,c_white,1)
				}

				if timer[2] >= 48 {timer[2] = 0}
			}
			else {
				if timer[2] >= 90 {
					frame[2] = 1
					timer[2] = 0
				}
			}

			if dir_hold() {
				w_tut = 1
						
				ini_open(global.soulfile)
					ini_write_real(string_lower(global.soul_name),"w",1)
				ini_close()
			}
		}
		
		switch mode {
			default:
				soul_move()
				clamper()
			break
			
			case 1:
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
			break
			
			case 2:
				if !i_exists(greenShield) {i_create(x + 7,y + 7,depth + 1,greenShield)}
			break
			
			case 3:
				var lines = ceil(bo.d[1] / bo.u[1])
			
				soul_move(1)

				with (bo) {
					draw_set_color(c_purple)
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
			break
			
			case 4:
				soul_move()
				clamper()
				
				switch global.gamemode {
					default:
						s_timer[0]--
					
						if z_pressed() and !s_timer[0] {
							s_timer[0] = 14
							audio_play(heart_shot)
						
							shot = i_create(x + 2.6,y + 2,,heartsht)
							shot.image_blend = dcol
							shot.image_yscale = 0
							shot.vspeed = -16
						}
					break
				}
			break
			
			case 5:
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
								sh.image_blend = dcol
							}

							inv = 0
							s_timer[0] = 0
							s_trigger[0] = 0
						}
					break
				}
				
				clamper()
			break
			
			case 6:
				var cval = 5
				s_timer[0]--
			
				if !s_trigger[0] {
					soul_move()
					
					if z_hold() and !s_timer[0] and dir_hold() {	
						audio_play(swing,,,,,random_range(1.1,1.3))
						inv = cval
						s_trigger[1] = 0
						s_trigger[0] = 1
					}
				}
				else {
					soul_move(,dsp * (3 * !x_hold()))
					
					a = i_create(xprevious,yprevious,depth + 1,afterimage)
					a.sprite_index = sprite_index
					a.image_blend = #CC3700
					a.ef = 1
					
					var epic_bl = b_bl_parent
					var bravedmg = inv

					var col = collision_line(x,y,x + sprite_width,y + sprite_height,epic_bl,0,1)
					
					if col != noone and !s_trigger[1] {
						if inv >= floor(cval / 2) {audio_play(punch_1)}
						else {audio_play(punch_0)}
						
						with (col) {hp -= bravedmg}
						
						global.tp += round(bravedmg * 0.9)
						
						s_trigger[1] = 1
					}
					
					if !bravedmg {
						s_trigger[0] = 0
						s_timer[0] = 5
					}
				}
				
				clamper()
			break
		}
	break
}

var ww = (sprite_width / 2)
var hh = (sprite_height / 2)

var xx = ww - lengthdir_x(ww,angle)
var yy = hh - lengthdir_y(hh,angle - 90)

xx -= hh - lengthdir_y(hh,angle) - hh
yy -= ww - lengthdir_x(ww,angle - 90) - ww

var xxx = x + xx
var yyy = y + yy

if mode = 5 and !s_trigger[0] {
	s_timer[1]++
	
	var sc = abs(sin(s_timer[1] / 8)) * (s_timer[0] / 80)
	
	gpu_set_blendmode(bm_add)
	draw_spr(,,xxx - sc * 8,yyy - sc * 8,image_xscale + sc,image_yscale + sc,angle,#00A2E8,image_alpha * 0.5)
	reset_bm()
}

draw_spr(,,xxx,yyy,,,angle)

if scene = -2 {
	draw_spr(heart_run,frame[1],x,y + 14)
	hspeed = -3
}
	
draw_hitbox()

if global.debug and display.d {
	var dx = (x + sprite_width) + 10
	var sc = 1
	var sp = 16

	draw_font(1,0)
	draw_txt_outline(dx,y,string(s_timer),c_white,,,,,sc,sc)
	draw_txt_outline(dx,y + sp,string(s_trigger),c_white,,,,,sc,sc)
	draw_txt_outline(dx,y + (sp * 2),"MODE: " + string(mode),c_white,,,,,sc,sc)
	draw_txt_outline(dx,y + (sp * 3),"TP: " + string(global.tp),c_white,,,,,sc,sc)
}

function soul_move(axis = 0,sped = sp) {
	var mx = -l_hold() + r_hold()
	var my = -u_hold() + d_hold()

	var xs = mx * sped
	var ys = my * sped

	if axis != 2 {x += xs}
	if axis != 1 {y += ys}
}

function clamper(lx0 = 0,ly0 = 0,lx1 = 0,ly1 = 0) {
	if !global.noclip {
		x = clamp(x,(board.l[1]) + lx0,(board.r[1] - 15) + lx1)
		y = clamp(y,(board.u[1]) + ly0,(board.d[1] - 15) + ly1)
	}
}