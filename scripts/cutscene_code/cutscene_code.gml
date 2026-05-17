#region OVERWROLD CUTSCENES
	function o_cutscene_code(){
		switch global.curCh {
			default:
				var antdead = (global.story[9] >= 3.3)

				switch room {
					#region RUINS
						case rm_hole0:
							if !global.story[0] {
								switch trigger {
									case 0:
										if !timer[0] {
											sprite_index = tori_worry_0_0
											image_index = 0
											if global.dejavu[0] {sprite_index = tori_worry_1}
										
											with(o_mainchara) {
												x = 140
												y = 120
											
												f = -1 * !global.dejavu[0]
												o_mainchara.y = o_mainchara.y - (8 * global.dejavu[0])
												c = 2
												sprite_index = chopper_c_0
												o_camera.y = y
											}
										
											f = instance_create_depth(139,132,o_mainchara.depth + 2,o_warnobj)
											f.sprite_index = frog_1
										}
									
										timer[0]++
									
										if timer[0] = 60 {
											timer[0] = 0
											trigger = 1 + (global.dejavu[0] * 0.1)
										
											a = instance_create_depth(0,0,0,dialogue)
											a.last_m = global.dejavu[0]
											for (var i = 0;i < 2;i++) {
												a.m[i] = tr($"tori0-{i}-{global.dejavu[0]}")
												a.e[i] = 16
												a.mo[i] = t_m_down1
											}
											a.can_play = 0
										}
									break
								
									case 1:
										if !dial_exists() {
											timer[0]++
									
											if timer[0] = 40 {
												a = instance_create_depth(0,0,0,dialogue)
												a.m = [tr("tori0-1-0")]
												a.e = [16]
												a.mo = [t_m_down1]
												a.can_play = 0
										
												timer[0] = 0
												trigger = 2
											}
										}
										else {image_index = dialogue.talking_spr}
									break
								
									case 1.1:
										if dial_exists() {image_index = dialogue.talking_spr}
										else {trigger = 2}
									break
								
									case 2:
										if dial_exists() {
											if !global.dejavu[0] {
												if dialogue.length < 13 {image_index = dialogue.talking_spr}
												else {
													if dialogue.length >= 17 {image_index = 1}
													else {
														sprite_index = tori_worry_0_1
														image_index = 0
													}
													if dialogue.length >= 25 {image_index = 2}
											
													if !dialogue.draw {
														sprite_index = tori_worry_0_1
														image_index = 2 * global.dejavu[0]
														dial_destroy()
													}
												}
											}
										}
										else {
											image_index = 2 * global.dejavu[0]
											audio_play(dial_toriel,,,,,1.15)
											with (o_mainchara) {
												if global.dejavu[0] {
													f = -1
													sprite_index = chopper_c_1
												}
											
												image_index = -1 + global.dejavu[0]
												shake(0,1)
												audio_play(swallow,,,,,1.2)
											}

											trigger = 3
										}
									break
								
									case 3:
										timer[0]++
									
										switch timer[0] {
											case 3:
												image_index = 3
											break
										
											case 6:
												image_index++
											break
										
											case 40:
												with (o_mainchara) {
													if global.dejavu[0] {image_index = 1}
													else {
														f = 0
														o_mainchara.image_index = 0
														o_mainchara.y = o_mainchara.y - 8
														o_mainchara.x = o_mainchara.x + 2
													}
													shake(0,1)
													audio_play(swallow,,,,,1.1)
												}
											break
										}
									
										if timer[0] = 70 {
											if !global.dejavu[0] {
												sprite_index = tori_worry_0_0
												image_index = 2
											}
										
											a = instance_create_depth(0,0,0,dialogue)
											a.x_line = 0
											for (var i = 0;i < 3;i++) {
												a.m[i] = tr("tori0-" + str(i + 2) + "-" + str(global.dejavu[0]))
												a.e[0] = 2
												a.mo[0] = t_m_up2
												a.e[i] = 1
												a.mo[i] = t_m_main
											}
											
											a.can_play = 0
										
											timer[0] = 0
											trigger = 4
										}
									break
								
									case 4:
										if dial_exists() {
											image_index = (2 + dialogue.talking_spr) + (3 * global.dejavu[0])
										
											if dialogue.cur_m {
												o_mainchara.f = 3
												o_mainchara.image_index = 0
											}
										}
										else {
											var tmax = 9
											timer[0]++
										
											if global.dejavu[0] {
												image_index = 7
												tmax = 4
											}
											else {
												if timer[0] = 3 {image_index = 4}
												if timer[0] = 6 {image_index = 5}
											}
										
											if timer[0] = tmax {
												timer[0] = 0
												trigger = 5
											
												sprite_index = toriel_1_t
												image_speed = 0
												music_play(m_toriel,,0.86)
											
												a = instance_create_depth(0,0,0,dialogue)
												a.char = 1
												a.x_line = 0
												for (var t0i = 0;t0i < 6;t0i++) {a.m[t0i] = tr("tori0-" + str(t0i + 5))}
												a.e = [1,1,4,2,5,2]
												a.mo = [t_m_main,t_m_main,t_m_up4,t_m_up2,t_m_up1,t_m_up4]

												a.can_play = 0
											}
										}
									break
								
									case 5:
										if dial_exists() {image_index = dialogue.talking_spr}
										else {
											timer[0]++
										
											if timer[0] = 20 {
												timer[0] = 0
												trigger = 6
											
												sprite_index = tori_worry_2
											
												a = instance_create_depth(0,0,0,dialogue)
												a.char = 1
												a.x_line = 0
												a.m[0] = tr("tori0-11")
												a.m[1] = tr("tori0-12")
												a.e[0] = 16
												a.e[1] = 5
												a.mo[0] = t_m_down1
												a.mo[1] = t_m_down5
												a.can_play = 0
											}
										}
									break
								
									case 6:
										if dial_exists() {
											if dialogue.length > 24 {
												dialogue.e[0] = 5
												dialogue.mo[0] = t_m_down5
											}
										}
										else {
											if o_camera.y != o_mainchara.y + 20 {o_camera.y += 2}

											if o_mainchara.y = 136 {
												o_mainchara.image_speed = 0
												o_mainchara.f = 2
											
												timer[0]++
											
												if timer[0] = 20 {
													with (o_warnobj) {
														audio_play(poing,,,0.5,,1.8)
														sprite_index = frog_0
														image_speed = 0.1
														x = x + 4
														y = y - 11
													}
												}
											
												if timer[0] > 20 and timer[0] < 31 {
													timer[1]++
												
													o_warnobj.y -= 4 - (timer[1] * 0.75)
												}
											
												if timer[0] = 50 {
													o_npc.x = o_warnobj.x
													o_npc.y = o_warnobj.y
													destroy(o_warnobj)
													a = instance_create_depth(0,0,0,dialogue)
													a.char = 1
													a.c[1] = -1
													a.m[0] = tr("tori0-13")
													a.m[1] = tr("frog")
													a.m[2] = tr("tori0-14")
													a.e[0] = 5
													a.mo[0] = t_m_down5
													a.e[2] = 2
													a.mo[2] = t_m_up2
													a.can_play = 0
									
													timer[0] = 0
													trigger = 7
												}
											}
											else {
												with (o_mainchara) {
													y += 2
													image_speed = 0.2
													f = 0
												}
											}
										}
									break
								
									case 7:
										if !dial_exists() {
											trigger = 8
											sprite_index = toriel_0
											image_speed = 0.2
											go_now(30,0,,o_cutsceneobj,240,130,0)
										}
									break
								
									case 8:
										if marked {
											image_speed = 0
											sprite_index = toriel_1_t
										
											a = instance_create_depth(0,0,0,dialogue)
											a.char = 1
											a.m[0] = tr("tori0-15")
											a.e[0] = 1
											a.mo[0] = t_m_up1
										
											trigger = 9
											marked = 0
										}
									break
								
									case 9:
										if dial_exists() {image_index = dialogue.talking_spr}
										else {image_index = 0}
										if o_mainchara.x >= 180 {trigger = 10}
									break
								
									case 10:
										if x < 605 {
											timer[0]++
										
											if timer[0] < 4 {sprite_index = toriel_0}
											else {
												sprite_index = toriel_3
												image_speed = 0.2
												x += 3
											}
										}
										else {
											if y > 110 {
												sprite_index = toriel_2
												y -= 3
											}
											else {
												image_index = 0
												image_speed = 0
												image_alpha -= 0.1
											}
										}
									break
								}
							
								if !image_alpha {end_cuts()}
							
								if o_mainchara.x > x and fading() {global.dejavu[1] = 2}
							}
							else {destroy()}
						break
		
						case rm_hole1:
							end_cuts()
						
							if o_mainchara.y > y and fading() {global.dejavu[1] = 0}
					
							if !global.story[1] {
								switch trigger {
									case 0:
										if global.dejavu[1] = 2 {
											switch timer[0] {
												case 0:
													y = 420
													x = 138
													o_mainchara.x = 162
													image_speed = 0.2
													sprite_index = toriel_2
													timer[0] = 1
												break
											
												case 1:
													if y > 320 {y -= 3}
													else {
														go_now(30,0,,o_cutsceneobj,145,260,0)
														timer[0] = 2
													}
												break
											
												case 2:
													if marked {
														timer[0] = 3
														marked = 0
													}
												break
											
												case 3:
													if o_mainchara.y > y {
														timer[1]++
													
														if timer[1] < 4 {sprite_index = toriel_3}
														else {
															sprite_index = toriel_0
															global.dejavu[1] = 0
															timer[0] = 0
														}
													
														image_index = 0
														image_speed = 0
													}
													else {
														timer[0] = 4
														trigger = 1
													}
												break
											}
										}
										else {trigger = (o_mainchara.y < 340)}
									break
								
									case 1:
										timer[0]++
									
										if timer[0] < 4 {sprite_index = toriel_3}
										else {
											if y > 115 {
												sprite_index = toriel_2
												image_speed = 0.2
												y -= 3
											}
										}
									break
								}
							
								if y <= 115 {
									image_speed = 0
									image_index = 0
									image_alpha -= 0.1
								}
							
								if !image_alpha {end_cuts(1)}
							}
							else {destroy()}
						break
		
						case rm_ruins0:
							end_cuts(1)
						
							if fading() {
								if o_mainchara.y < y {global.dejavu[1]++}
								else {global.dejavu[1] = 0}
							}
						
							if !global.story[2] {
								switch trigger {
									case 0:
										if global.dejavu[1] {
											if !timer[0] {
												o_mainchara.x = 160
												x = 135
												y = 480
												sprite_index = toriel_2
												image_speed = 0.2
												timer[0] = 1
											}
											else {
												if y >= 300 and x >= 145 {
													y = 300
													x = 145
												
													if o_mainchara.y > 400 {
														timer[1]++
														image_index = 0
														image_speed = 0
												
														if timer[1] < 4 {sprite_index = toriel_3}
														else {
															global.dejavu[1] = 0
															timer[1] = 0
															sprite_index = toriel_0
														}
													}
													else {
														timer[1] = 0
														trigger = 1
													}
												}
												else {
													y -= 3
												
													if y <= 315 {x += 2}
												}
											}
										}
										else {trigger = (o_mainchara.y <= 400)}
									break
								
									case 1:
										sprite_index = toriel_2
										image_speed = 0.2
										y -= 3
									
										if y <= 195 {
											var xpos = 245 - (200 * (o_mainchara.x < 150))
										
											go_now(60,0,,o_cutsceneobj,xpos,95)
										
											trigger = 2
										}
									break
								
									case 2:
										if marked {
											y -= 2
									
											if y <= 85 {
												var xpos = 225
												if x < 100 {xpos = 65}
											
												go_now(20,0,,o_cutsceneobj,xpos,65)
											
												marked = 0
												trigger = 3
											}
										}
									break
								
									case 3:
										if marked {
											if o_mainchara.y > 160 {
												sprite_index = toriel_0
												image_index = 0
												image_speed = 0
											}
											trigger = 4
											marked = 0
										}
									break
								
									case 4:
										if o_mainchara.y <= 160 {
											if x < 100 {sprite_index = toriel_3}
											else {sprite_index = toriel_1}
										
											image_speed = 0.2
										
											go_now(30,0,,o_cutsceneobj,145,65)
											trigger = 5
										}
									break
								
									case 5:
										if marked {
											marked = 0
											timer[1] = 1
										}
								
										if timer[1] {
											sprite_index = toriel_2
											y -= 3
											image_alpha -= 0.2
										}
									break
								}
							}
							else {destroy()}
						
							if !image_alpha {end_cuts(2)}
						break
			
						case rm_ruins1:
							end_cuts(2)
						
							mask_index = toriel_mask
						
							o_mainchara.bpos = !(global.story[3] = 2)
						
							if x >= room_width {end_cuts(3,2)}
						
							if global.story[3] < 2 {
								switch trigger {
									case 0:
										if !global.story[3] {
											if !global.dejavu[1] {
												if o_mainchara.w {
													a = instance_create_depth(0,0,0,dialogue)
													a.x_line = 0
													a.can_play = 0
													for (var i = 0;i < 6;i++) {
														a.m[i] = tr("tori1-" + str(i) + "-0")
														a.e[i] = 1
														a.mo[i] = t_m_main
													}
													a.e[5] = 2

													trigger = 1
													o_mainchara.image_index = 0
													o_mainchara.image_speed = 0
												}
											}
											else {
												char_stop(0)
											
												switch timer[0] {
													case 0:
														sprite_index = toriel_2
														image_speed = 0.2
														x = 135
														y = 235
														o_mainchara.x = 160
												
														timer[0]++
													break
												
													case 1:
														sprite_index = toriel_2
														image_speed = 0.2
												
														if y > 100 {y -= 3}
														else {
															y = 100
															timer[0]++
														}
													break
												
													case 2:
														sprite_index = toriel_3
													
														if x < 145 {x += 3}
														else {
															x = 145
															sprite_index = toriel_0_t
														
															var cool = (global.dejavu[1] = 2)
														
															a = instance_create_depth(0,0,0,dialogue)
															a.last_m = 5 + (3 * cool)
															a.x_line = 0
															a.can_play = 0
															for (var i = 0;i < 9;i++) {
																a.m[i] = tr("tori1-" + str(i) + "-" + str(cool))
																a.e[i] = 2
																a.mo[i] = t_m_main
															}
														
															a.e[5] = 2
														
															if cool {
																a.e[1] = 5
																a.e[2] = 3
																a.e[3] = 3
																a.e[4] = 49
																a.mo[1] = t_m_up1
																a.mo[2] = t_m_up2
																a.mo[3] = t_m_up2
																a.mo[4] = t_m_up2
															}
														
															timer[0] = 0
															trigger = 1
														}
													break
												}
											}
										}
										else {
											sprite_index = toriel_0_t
											image_speed = 0
											image_index = 0
											y = 40
											x = 195

											r1b1.pressed = 1
											r1b2.pressed = 1
											r1b3.pressed = 1
											r1b4.pressed = 1

											trigger = 4
										}
									break
								
									case 1:
										if dial_exists() {
											image_index = dialogue.talking_spr
										
											if dialogue.cur_m = 4 and dialogue.length >= 29 and global.dejavu[1] = 2 {
												dialogue.e[4] = 5
												dialogue.mo[4] = t_m_up1
											}
										
											var cool = 3 * (global.dejavu[1] = 2)
										
											if dialogue.cur_m >= 2 + cool and dialogue.cur_m < 5 + cool {sprite_index = toriel_3_t}
											else {sprite_index = toriel_0_t}
										}
										else {
											switch timer[0] {
												case 0:
													if x < 215 {
														image_speed = 0.2
														sprite_index = toriel_3
														x += 4
													}
													else {timer[0]++}
												break
											
												case 1:
													if y > 60 {
														sprite_index = toriel_2
														y -= 4
													}
													else {timer[0]++}
												break
											
												case 2:
													if x > 175 {
														sprite_index = toriel_1
														x -= 4
													}
													else {timer[0]++}
												break
											
												case 3:
													if y > 40 {
														sprite_index = toriel_2
														y -= 4
													}
													else {timer[0]++}
												break
											
												case 4:
													if x < 195 {
														sprite_index = toriel_3
														x += 4
													}
													else {
														sprite_index = toriel_2
														image_speed = 0
														image_index = 0
														instance_create_depth(r1l1.x,r1l1.y,depth,hitbox)
													
														timer[0] = 0
														trigger = 2
													}
												break
											}
										}
									break
							
									case 2:
										timer[0]++

										if timer[0] = 40 {sprite_index = toriel_1_t}
							
										if timer[0] = 80 {
											a = instance_create_depth(0,0,0,dialogue)
											a.m[0] = tr("tori1-6")
											a.e[0] = 5
											a.mo[0] = t_m_main
											a.can_play = 0

											timer[0] = 0
											trigger = 3
										}
									break
							
									case 3:
										if !dial_exists() {
											switch timer[0] {
												case 75:
												case 70:
												case 40:
												case 30:
												case 0:
													sprite_index = toriel_2_t
													instance_create_depth(r1l1.x,r1l1.y,depth,hitbox)
												break
											}
										
											timer[0]++
							
											if timer[0] >= 125 {
												timer[1]++
										
												if timer[1] < 4 {sprite_index = toriel_1}
												else {
													sprite_index = toriel_0_t
													timer[0] = 0
													timer[1] = 0
													trigger = 4
													end_cuts(3)
													global.dejavu[1] = 0
											
													a = instance_create_depth(0,0,0,dialogue)
													a.x_line = 0
													a.m[0] = tr("tori1-7")
													a.m[1] = tr("tori1-8")
													a.e[0] = 5
													a.e[1] = 2
													a.mo[0] = t_m_up1
													a.mo[1] = t_m_main
												}
											}
										}
									break
								
									case 4:
										if dial_exists() {
											if timer[1] and dialogue.sound = dial_toriel {
												image_index = dialogue.talking_spr
										
												if o_mainchara.x <= x and o_mainchara.y <= 220 {sprite_index = toriel_1_t}
												else {sprite_index = toriel_0_t}
											}
										}
										else {
											timer[1] = 1

											if r1b5.pressed and r1b6.pressed {
												char_stop()
												timer[0]++
											
												if timer[0] < 60 {sprite_index = toriel_0_t}
											
												switch timer[0] {
													case 60:
														sprite_index = toriel_1_t
													break
												
													case 120:
														timer[0] = 0
														timer[1] = 0
														trigger = 5
													
														a = instance_create_depth(0,0,0,dialogue)
														a.x_line = 0
														a.can_play = 0
														for (i = 0;i < 3;i++) {
															a.m[i] = tr("tori1-" + str(9 + i) + "-0")
															a.e[i] = 5
															a.mo[i] = t_m_down1
														}
														a.e[2] = 2
														a.mo[2] = t_m_up2
													break
												}
											}
											
											if r1l2.nah {
												sprite_index = tori_worry_2
												trigger = 6
											
												a = instance_create_depth(0,0,0,dialogue)
												a.x_line = 0
												a.can_play = 0
												for (var i = 0;i < 3;i++) {a.m[i] = tr("tori1-" + str(9 + i) + "-1")}
												a.e[0] = 5
												a.e[1] = 15
												a.e[2] = 2
												a.mo[0] = t_m_up1
												a.mo[2] = t_m_main
											}
										}
									break
								
									case 5:
										if !timer[1] {
											if dial_exists() {
												if dialogue.cur_m = 1 {sprite_index = tori_worry_2}
												if dialogue.cur_m = 2 and dialogue.length >= 10 {sprite_index = toriel_1_t}
												image_index = dialogue.talking_spr
											}
											else {
												if x > 175 {
													x -= 3
													image_speed = 0.2
													sprite_index = toriel_1
												}
												else {
													sprite_index = toriel_2
													image_index = 0
													image_speed = 0
													r1l2.nah = 1
													timer[1] = 1
												}
											}
										}
										else {
											timer[0]++
										
											if timer[0] = 30 {
												shake(0,2)
												sprite_index = tori_tada
											
												timer[0] = 0
												timer[1] = 0
												trigger = 6
											
												a = instance_create_depth(0,0,0,dialogue)
												a.x_line = 0
												a.can_play = 0
												for (var i = 0;i < 3;i++) {a.m[i] = tr("tori1-" + str(12 + i) + "-0")}
												a.e[0] = 49
												a.e[1] = 3
												a.mo[0] = t_m_up2
												a.mo[1] = t_m_up2
											}
										}
									break
								
									case 6:
										if dial_exists() {
											if sprite_index != tori_worry_2 {
												if !dialogue.cur_m and dialogue.length < 9 {dialogue.pitch = 1.15}
												else {dialogue.pitch = 1}
											
												if dialogue.cur_m {sprite_index = toriel_0_t}
											}
										}
										else {
											trigger = 7
											image_speed = 0.2
											sprite_index = toriel_0
										
											go_now(30,0,,o_cutsceneobj,255,120)
										}
									break
								
									case 7:
										switch timer[0] {
											case 0:
												if marked {
													marked = 0
											
													image_speed = 0
													sprite_index = toriel_1_t
											
													a = instance_create_depth(0,0,0,dialogue)
													a.m[0] = tr("tori1-14")
													a.e[0] = 2
													a.mo[0] = t_m_main
													destroy(rtoriint)
											
													timer[0]++
												}
											break
										
											case 1:
												if dial_exists() {image_index = dialogue.talking_spr}
												else {timer[0]++}
											break
										
											case 2:
												timer[1]++

												if timer[1] < 4 {sprite_index = toriel_0}
												else {
													image_speed = 0.2
													sprite_index = toriel_3
	
													if x < room_width {x += 3}
												}
											break
										}
									break
								}
							}
							else {
								destroy()
								destroy(rtoriint)
							}
						break
			
						case rm_ruins2b:
							end_cuts(3,2)
						
							mask_index = toriel_mask
						
							if x >= room_width {end_cuts(4,2)}
							if o_mainchara.x > 500 and fading(1) {end_cuts(5)}
						
							if global.story[4] < 2 {
								if !global.story[4] {
									sprite_index = tori_think
									image_speed = 0

									if dial_exists() and dialogue.sound = dial_toriel {image_index = dialogue.talking_spr}
									else {
										if !fading() {image_index = 0}
										else {image_index = 2}
									}
								}
								else {
									switch trigger {
										case 0:
											if !timer[0] {
												char_stop()
												reset_cam()
											
												sprite_index = tori_tada
												image_speed = 0
												image_index = 0
												x = 345
												destroy(bint)
												destroy(toriint2)
											
												a = instance_create_depth(0,0,0,dialogue)
												a.x_line = 0
												for (var i = 0;i < 4;i++) {a.m[i] = tr("tori2-" + str(6 + i))}
												a.e[0] = 49
												a.e[1] = 1
												a.e[2] = 2
												a.e[3] = 1
												a.mo[0] = t_m_up2
												a.mo[1] = t_m_main
												a.mo[2] = t_m_up2
												a.mo[3] = t_m_main
											
												timer[0] = 1
											}
											else {
												if dial_exists() {
													image_index = dialogue.talking_spr
												
													if dialogue.cur_m {sprite_index = toriel_0_t}
												}
												else {trigger = 1}
											}
										break
									
										case 1:
											x += 3
											sprite_index = toriel_3
											image_speed = 0.2
										break
									}
								}
							}
							else {
								destroy()
								destroy(bint)
								destroy(toriint2)
							}
						break
			
						case rm_ruins3b:
							if !global.story[5] {
								switch trigger {
									case 0:
										with (o_mainchara) {
											c = 2
											f = 3
											image_speed = 0.2
										}
							
										sprite_index = toriel_3
										image_speed = 0.2
							
										go_now(30,0,,o_mainchara,125,110)
										go_now(30,0,,id,170,85)
										trigger = 1
									break
								
									case 1:
										if marked {
											marked = 0
										
											a = instance_create_depth(0,0,0,dialogue)
											a.char = 1
											a.m[0] = tr("tori3-0")
											a.m[1] = tr("tori3-1")
											a.e[0] = 1
											a.e[1] = 1
											a.mo[0] = t_m_main
											a.mo[1] = t_m_main
											a.can_play = 0

											char_stop()
											image_speed = 0
											image_index = 0
											sprite_index = toriel_2_t
											o_mainchara.f = 2

											trigger = 2
										}
									break
								
									case 2:
										if dial_exists() {
											image_index = dialogue.talking_spr
										
											if dialogue.cur_m {
												sprite_index = toriel_1_t
												o_mainchara.f = 3
											}
										}
										else {
											o_mainchara.f = 2
											trigger = 3
											sprite_index = toriel_2
											image_speed = 0.2
											go_now(30,0,,o_cutsceneobj,146,35)
										}
									break
								
									case 3:
										if marked {
											marked = 0
								
											x = 143
								
											image_index = 0
											sprite_index = tori_pull
											audio_play(bump)
											shake(0,2)
										}
										else {
											if !timer[1] {
												timer[0]++
										
												switch timer[0] {
													case 102:
													case 86:
													case 6:
														image_index = 1
													break
											
													case 142:
													case 98:
													case 60:
														image_index = 0
														audio_play(bump)
														shake(0,2)
													break
											
													case 146:
														image_index = 1
									
														a = instance_create_depth(0,0,0,dialogue)
														a.char = 1
														a.m[0] = tr("tori3-2")
														a.e[0] = 5
														a.mo[0] = t_m_down1
														a.can_play = 0
									
														timer[0] = 0
														timer[1]++
													break
												}
											}
											else {
												if !dial_exists() {
													if !timer[0] {
														image_index = 0
														audio_play(bump)
														shake(0,2)
													}
								
													if timer[0] = 6 {image_index = 1}
								
													timer[0]++
												
													if timer[0] < 90 {
														if timer[0] % 20 == 0 {
															image_index = 0
															audio_play(bump)
															shake(0,2)
														}
								
														if timer[0] % 26 == 0 {image_index = 1}
													}
								
													if timer[0] = 120 {
														timer[0] = 0
														trigger = 4
													
														sprite_index = toriel_2_t
														x = 146
								
														a = instance_create_depth(0,0,0,dialogue)
														a.char = 1
														a.last_m = 4 - (2 * (global.dejavu[6]))

														if !global.dejavu[6] {
															for (var i = 0;i < 5;i++) {a.m[i] = tr("tori3-" + str(3 + i))}
															a.e[0] = 5
															a.e[1] = 49
															a.e[2] = 3
															a.e[3] = 3
															a.e[4] = 4
															a.mo[0] = t_m_static
															a.mo[1] = t_m_up3
															a.mo[2] = t_m_up3
															a.mo[3] = t_m_up3
															a.mo[4] = t_m_up2
														}
														else {
															for (var i = 0;i < 3;i++) {a.m[i] = tr("tori3-" + str(3 + i) + "-1")}
															a.e[0] = 5
															a.e[1] = 19
															a.e[2] = 1
															a.mo[0] = t_m_static
															a.mo[1] = t_m_static
															a.mo[2] = t_m_main
															a.mo_f[1] = 3
														}
													}
												}
											}
										}
									break
								
									case 4:
										if dial_exists() {
											if sprite_index != tori_giggle {image_index = dialogue.talking_spr}
											else {image_speed = 0.2}
										
											if !global.dejavu[5] {
												dialogue.pitch = 1 + (0.15 * (dialogue.cur_m = 1))
										
												switch dialogue.cur_m {
													case 1:
														sprite_index = tori_giggle
													break
											
													case 4:
														sprite_index = toriel_0_t
													break
												}
											}
										}
										else {trigger = 5}
									break
								
									case 5:
										sprite_index = toriel_0
										image_speed = 0.2
										y += 3
									break
								}
							}
							else {destroy()}
						
							if y > room_height {end_cuts(5)}
						break
			
						case rm_ruins3bb_old:
							switch trigger {
								case 0:
									if y < 240 {
										with (o_mainchara) {
											c = 2
											image_speed = 0.2
											y += 2
											x = 160
											o_camera.y = y + 20
										}
									
										y += 2
										sprite_index = toriel_0
										image_speed = 0.2
									}
									else {
										trigger = 1
										sprite_index = toriel_0_t
										image_speed = 0
										char_stop()
									
										a = instance_create_depth(0,0,0,dialogue)
										for (var i = 0;i < 4;i++) {a.m[i] = tr("tori4-" + str(i))}
										a.e[0] = 2
										a.e[1] = 1
										a.e[2] = 1
										a.e[3] = 1
										a.mo[0] = t_m_up2
										a.mo[1] = t_m_main
										a.mo[2] = t_m_main
										a.mo[3] = t_m_main
										a.can_play = 0
									}
								break
							
								case 1:
									if dial_exists() {
										image_index = dialogue.talking_spr
									
										if dialogue.cur_m > 1 {
											o_mainchara.f = 2
											sprite_index = tori_nerd
										}

										if dialogue.cur_m = 3 and !dialogue.draw {
											image_index = 2
											shake(0,2)
											shake(0,2,o_mainchara)
											shake()
											r_bridge._shake = 1

											music_stop()
											dial_destroy()
										}
									}
									else {
										if !r_bridge._shake {
											timer[0]++
										
											if timer[0] = 120 {
												trigger = 2
												timer[0] = 0
											
												a = instance_create_depth(0,0,0,dialogue)
												a.char = 1
												a.m[0] = tr("tori4-4")
												a.pitch = 0.95
												a.sp = -1
												a.e[0] = 37
												a.mo[0] = t_m_down1
												a.can_play = 0
												a.can_finish = !global.dejavu[6]
												a.skippable = !global.dejavu[6]
											}
										}
									}
								break
							
								case 2:
									if global.dejavu[6] {
										with (o_mainchara) {
											y -= 2
											image_speed = 0.2
										}
									
										timer[0]++
									
										if timer[0] = 8 {
											dial_destroy()
											sprite_index = tori_grab_0
										
											with (o_mainchara) {
												f = -1
												sprite_index = chopper_b_0
												shake(0,1)
											}
										
											shake(0,1)
										
											audio_play(bump,,,,,0.8)
											audio_play(bump)
											audio_play(battle_begin_0,,,0.6)

											a = instance_create_depth(0,0,0,dialogue)
											a.char = 1
											a.x_line = 0
											a.m[0] = tr("tori4-5-1")
											a.pitch = 1.15
											a.e[0] = 32
											a.mo[0] = t_m_down1
											a.can_play = 0

											timer[0] = 0
											trigger = 3
										}
									}
									else {
										if dial_exists() {
											image_index = dialogue.talking_spr + 2
											image_speed = 0
										
											if !dialogue.draw {dial_destroy()}
										}
										else {
											sprite_index = tori_skid
											image_index = 2
										
											with (o_mainchara) {
												f = -1
												sprite_index = chopper_skid
												image_index = 2
											}
										
											timer[0]++
										
											o_mainchara.x = 160 - rnd_r(1,-1)
											o_mainchara.y = 280 - rnd_r(1,-1)
								
											x = 135 - rnd_r(1,-1)
											y = 240 - rnd_r(1,-1)
								
											if !i_exists(shake_screen) {shake()}
								
											r_bridge._shake = 1
										
											if timer[0] = 40 {
												timer[0] = 0
												a = instance_create_depth(0,0,0,dialogue)
												a.char = 1
												a.x_line = 0
												trigger = 4
												a.pitch = 1.05
												a.m[0] = tr("tori4-5-0")
												a.m[1] = tr("tori4-6")
												a.e[0] = 37
												a.e[1] = 37
												a.mo[0] = t_m_down1
												a.mo[1] = t_m_down1
												a.can_play = 0
												trigger = 3
											}
										}
									}
								break
							
								case 3:								
									if !dial_exists() {
										o_mainchara.y += 5
										y += 5

										if !timer[0] {
											r_bridge._shake = 0
											r_bridge._fall = 1
											timer[0] = 1
										}
									
										if !global.dejavu[6] {
											sprite_index = toriel_0
											image_speed = 0.4
										
											with (o_mainchara) {
												f = -1
												sprite_index = chopper_0_r
												image_speed = 0.4
											}
										}
										else {
											sprite_index = tori_grab_1
											image_speed = 0.4
										
											with (o_mainchara) {
												sprite_index = chopper_b_1
												image_speed = 0.4
											}
										}
									
										reset_cam()
									
										if y >= 540 {
											trigger = 4
											timer[0] = 0
											sprite_index = toriel_sus_1
										
											with (o_mainchara) {
												f = -1
												sprite_index = chopper_skid
												image_speed = 0
												image_index = 1
											}

											audio_play_echo(tori_s,,,,,,0.26,0.18,1)
											audio_play(fall_1)	
										}
									}
									else {
										o_mainchara.x = 160 - rnd_r(1,-1)
										o_mainchara.y = 280 - rnd_r(1,-1)
								
										x = 135 - rnd_r(1,-1)
										y = 240 - rnd_r(1,-1)

										r_bridge._shake = 1
									
										if !i_exists(shake_screen) {shake()}
									}
								break
							
								case 4:
									x -= 2

									timer[0] += 0.5
									
									y -= 4 - timer[0]
									
									o_mainchara.x += 2									
									o_mainchara.y -= 4 - timer[0]
							
									timer[1]++
							
									if timer[1] = 90 {
										o_mainchara.alphaValue = 1
										audio_play_echo(bigdoor,,,,,,0.26,0.18,1)
									}
							
									if timer[1] = 200 {
										trigger = 5
										timer[0] = 0
										timer[1] = 0
										audio_play(rumble,,1)
										audio_sound_pitch(rumble,0)
									}
								break
						
								case 5:
									timer[0] += (1 + any_hold()) * 0.2
											
									audio_sound_pitch(rumble,timer[0] * 0.02)
							
									if timer[0] >= 80 {finish_plot()}
								break
							}
						break
					#endregion
		
					#region GARDENS (ENTRANCE)
						case rm_gardens0:
							if !global.story[7] {
								char_stop(0)
								reset_cam()
								destroy(start_fade)
									
								timer[0] += 1 + main_pressed() + global.dejavu[7]
							
								if timer[0] < 60 {
									with (o_mainchara) {
										x = 145
										y = 160
										f = -1
										sprite_index = chopper_c_0
										image_speed = 0
									}
								}
								else {
									if !timer[1] {
										with (o_mainchara) {
											audio_play(battle_begin_0,,,0.5)
											shake(0,2)
											image_index = 1
										}
											
										timer[1]++
									}
								}
									
								if timer[0] >= 110 {
									if timer[1] < 2 {
										audio_play(battle_begin_0,,,0.5,,0.9)
										with (o_mainchara) {
											f = 0
											x = 150
											y = 150
											image_index = 0
										}
										shake(0,1,o_mainchara)
										timer[1]++
									}
								}
									
								if timer[0] >= 122 {
									char_free()
									end_cuts(7)
								}
							}
							else {destroy()}
						break

						case rm_gardens2:
							if !global.story[8] {
								sprite_index = ant_cuts
								sil = 1
								scol = #1E1A24
								image_speed = 0
							
								switch trigger {
									case 0:
										if o_mainchara.x >= 340 {
											shake(0,2)
											image_index = 1
											trigger = 1
										}
									break
								
									case 1:
										timer[0]++

										if timer[0] >= 15 {
											timer[1]++
											image_index = 4
											y -= 5 - (timer[1] * 0.3)
											x += 8
										}

										if x > room_width {end_cuts(9)}
									break
								}
							}
							else {
								if global.story[8] = 2 {destroy(antint0)}
								destroy()
							}
							
							if fading() and o_mainchara.x >= 340 {global.story[8] = 2}
						break

						case rm_gardens5:
							image_speed = 0
					
							if global.story[9] < 2 {
								sprite_index = ant_cuts

								switch trigger {
									case 0:
										if o_mainchara.y <= 580 {
											char_stop()
											music_pause()
										
											image_index = 2
											trigger = 1
										}
									break
								
									case 1:
										if o_camera.y > 520 {o_camera.y -= 2}
										else {
											o_camera.y = 520
										
											timer[0]++
										
											if timer[0] >= 20 {
												timer[1]++
											
												g3bush.x -= cos(timer[1]) / 1.5
												g3bush.y -= sin(timer[1]) / 1.5
							
												if timer[1] % 2 == 0 {instance_create_depth(irnd_r(g3bush.x,x + g3bush.sprite_width),irnd_r(g3bush.y,y + g3bush.sprite_height),g3bush.depth - 2,g_leaf)}

												if timer[1] = 30 {
													trigger = 2
													timer[1] = 0
													timer[0] = 0
								
													audio_play(poing,,,,,0.9)
								
													with (g3bush) {
														x = xstart
														y = ystart
														o_cutsceneobj.x = x + sprite_width - 5
														o_cutsceneobj.y = y + 5
													}
												}
											}
										}
									break
								
									case 2:
										timer[0]++
										if !timer[1] {
											x += 4
											y -= 4 - (timer[0] * 0.65)
										}
							
										depth = g3bush.depth - 2

										if y >= 500 {
											if !timer[1] {
												y = 500
												image_index = 3
												audio_play(bump,,,,,0.9)
											}
										
											timer[1]++
							
											o_mainchara.bpos = 1
							
											if x < 150 {x += 4 - (timer[1] * 0.29)}
											else {x = 150}
							
											if timer[1] = 60 {
												if !global.story[9] {
													trigger = 3
													timer[0] = 0
													timer[1] = 0
													image_index = 4
												
													audio_play(poing,,,,,1.1)
												}
												else {
													trigger = 4
													timer[0] = 0
													timer[1] = 0
												}
											}
										}
									break
								
									case 3:
										timer[0]++
							
										y -= 4 - (timer[0] * 0.6)
							
										if timer[0] = 13 {
											audio_play(poing,,,,,rnd_r(0.9,1.1))
											y = 500
											image_index = 5
											trigger = 4

											a = instance_create_depth(0,0,0,dialogue)
											a.char = 0
											for (var i = 0;i < 3;i++) {a.m[i] = tr("ant0-" + str(i))}
											a.can_play = 0
								
											timer[0] = 0
											timer[1] = 0
										}
									break
								
									case 4:
										if dial_exists() {
											timer[0]++
							
											y -= 4 - (timer[0] * 0.6)
							
											if timer[0] = 13 {
												y = 500
												timer[0] = 0
												audio_play(poing,,,,,rnd_r(0.9,1.1))
												if image_index < 7 {image_index++}
												else {image_index = 4}
											}

											if a.cur_m = 2 and !a.draw {dial_destroy()}
										}
										else {
											if !timer[1] {
												timer[0] = 0
												y = 500
												shake(0,2)
												image_index = 0
												audio_play(battle_begin_0)
											}
										
											timer[1]++
										
											if timer[1] = 40 {
												image_index = 1
												global.story[9] = 1
												shake(0,2)

												o_mainchara.enemy = 1
												global.bstory = 1
												instance_create_depth(x + 6,y - 9,depth,o_warnobj)
											}
										}
									break
								}
							}
							else {
								music_resume()
							
								if global.story[9] < 3 {
									switch trigger {
										case 0:
											char_stop()
										
											var dtime = 80
									
											if event_type = ev_create {
												sprite_index = ant_cuts
												x = 150
												y = 500
												o_camera.y = 520
										
												with (o_mainchara) {
													x = 150
													y = 580
												}

												image_speed = 0
												sprite_index = ant_0
										
												switch global.story[9] {
													case 2.1:
														sprite_index = ant_0_scared
													break
											
													case 2.2:
														sprite_index = ant_cuts
														image_index = 8
													break
												}
											}
										
											timer[0]++
										
											switch global.story[9] {
												case 2:
													image_index = audio_is_playing(dial_ant)
											
													if timer[0] = 40 {
														sprite_index = ant_0_happy
														audio_play(dial_ant)
													}
												break
											
												case 2.1:
												case 2.2:
													var storymult = (global.story[9] - 2) * 10

													if !(global.story[9] = 2.2 and timer[0] >= 30) {x = 150 + rnd_r(0.5 * storymult,-(0.5 * storymult))}
											
													if global.story[9] = 2.1 {
														image_index = audio_is_playing(dial_ant)
														if timer[0] = 40 {audio_play(dial_ant,,,,,1.1)}
													}
													else {
														dtime = 130
													
														switch timer[0] {
															case 30:
																shake(0,2)
																image_index = 9
															break
													
															case 70:
																sprite_index = ant_0_scared
																x = 153
																y = 506
																image_index = 0
															break
													
															case 110:
																shake(0,2)
																sprite_index = ant_cuts
																image_index = 1
																x = 150
																y = 500
																audio_play(ant_s)
															break
														}
													}
												break
											}
										
											if timer[0] = dtime {
												timer[0] = 0
												trigger = 1
												y = y - 4
												audio_play(poing)
												sprite_index = ant_cuts
												image_index = 10 - (6 * (global.story[9] = 2.2))
											}
										break
								
										case 1:
											depth = -9999
								
											timer[0]++
								
											x += 8
											y -= 8 - (timer[0] * 0.5)
								
											if timer[0] >= 40 {
												if o_camera.y < o_mainchara.y + 20 {o_camera.y += 2}
												else {
													timer[0] = 0
													char_free()
													end_cuts(9,global.story[9] + 1)
												}
											}
										break
									}
								}
								else {destroy()}
							}
						break
					#endregion
			
					#region GARDENS (1)
						#region FIRST PICKUP ROOM
							case rm_gardens8:
								if global.story[11] < 3 {
									if i_exists(o_warnobj) {o_warnobj.area = 0}
								
									if global.story[11] != 1 {
										if i_exists(gfruit0) {
											gfruit0.lay = -4
										
											if !trigger {gfruit0.depth = gtreefruit0.depth - 1000}
											else {o_mainchara.depth = gfruit0.depth + 1}
										
											switch trigger {
												case 1:
													if !dial_exists() {
														if !timer[0] {
															with (o_mainchara) {
																char_stop()
																f = -1
																shake(0,1)
																audio_play(battle_begin_0)
																sprite_index = chopper_pickec
															}
														}
													
														timer[0]++
													
														if timer[0] >= 20 {
															o_mainchara.image_index = 1
															audio_play(poing,,,0.8,,0.9)
															timer[0] = 0
															timer[1] = o_mainchara.y
															global.lay = 1
															trigger = 2
														}
													}
												break
											
												case 2:
													timer[0]++
													o_mainchara.y -= floor(4 - (timer[0] * 0.3))
										
													if (timer[0] * 0.3) > 3.4 {
														gfruit0.x = o_mainchara.x + 3
											
														if !timer[2] {
															repeat(4) {
																audio_play(leaf,,,0.8,,rnd_r(0.8,1))
																instance_create_depth(gfruit0.x + irnd_r(4,-4),gfruit0.y + irnd_r(4,-4),gfruit0.depth - 1,g_leaf)
															}
															timer[2] = 1
														}

														gfruit0.y = o_mainchara.y - 12
														gfruit0.depth = o_mainchara.depth - 1
													}

													if o_mainchara.y >= timer[1] {
														global.lay = 0
														o_mainchara.y = timer[1]
														timer[0] = 0
														trigger = 3
														audio_play(victory_1,,,0.9)
														o_mainchara.image_index = 2
												
														a = instance_create_depth(0,0,0,dialogue)
														a.char = 0
														a.x_line = 0
														a.m[0] = tr("* (Ah-Ha! You know you can always }  count on your Umbrella!)}* (You got Eye Candy!)")
													}
												break
											
												case 3:
													if !i_exists(dialogue) {
														add_item(,"Eye Candy")
														trigger = 0
														timer[0] = 0
														timer[1] = 0
														timer[2] = 0
														o_mainchara.f = 0
														global.story[11]++
													}
												break
											}
										}
									}
									else {
										destroy(gfruit0)
										destroy(gfruitint0)
									}
								
									if global.story[11] != 2 {
										if i_exists(gfruit1) {gfruit1.depth = gbushfruit0.depth - 1}
										
										if dial_exists() and dialogue.cur_m = 2 and dialogue.m[2] = tr("* (You got Eye Candy!)") {
											if i_exists(gfruit1) {
												add_item(,"Eye Candy")
												destroy(gfruit1)
												destroy(gfruitint1)
											}
										}
										
										if trigger = 10 and !dial_exists() {global.story[11] = 2}
									}
									else {
										destroy(gfruit1)
										destroy(gfruitint1)
									}
								}
								else {
									destroy(o_warnobj)
									destroy(gfruitint0)
									destroy(gfruitint1)
									destroy()
								}
							break
						#endregion
					
						#region STUPID FRUIT ROOM
							case rm_gardens9b:
								if !global.story[12] and !antdead {
									sprite_index = ant_cuts
									image_speed = 0
								
									switch trigger {
										case 0:
											if dial_exists() and dialogue.m[2] = tr("* You have the Stupid Fruit!") {trigger = 1}
										break
									
										case 1:
											if !dial_exists() {
												timer[0]++
												char_stop()
											
												g_bush_0.x -= cos(timer[0]) / 1.5
												g_bush_0.y -= sin(timer[0]) / 1.5
							
												if timer[0] % 2 == 0 {instance_create_depth(irnd_r(g_bush_0.x + 5,g_bush_0.x + g_bush_0.sprite_width - 5),irnd_r(g_bush_0.y + 5,g_bush_0.y + g_bush_0.sprite_height - 5),g_bush_0.depth - 2,g_leaf)}
										
												if timer[0] >= 30 {
													char_stop()
													trigger = 2
													timer[0] = 0
												
													image_index = 10
												
													with (g_bush_0) {
														x = xstart
														y = ystart
														depth = depth - 2
														o_cutsceneobj.x = o_mainchara.x - 4
														o_cutsceneobj.y = y + 5
													}
												}
											}
										break
									
										case 3:
										case 2:
											var pit = 0.9
											var st = 4
											var dest = (y + sprite_height) >= o_mainchara.y + 1
											var fin = (o_mainchara.y - sprite_height) - 2

											if trigger = 3 {
												sf.y = y
												pit = 0.8
												st = 5
												dest = (y + sprite_height) >= o_mainchara.y + 10
												fin = ((o_mainchara.y + 10) - sprite_height) - 2
												sf.depth = depth - 1
											}
										
											if timer[0] = 0 {audio_play(poing,,,,,0.9)}
										
											if timer[0] = 18 and trigger = 3 {
												o_mainchara.image_index = 1
												shake(0,1,o_mainchara)
												audio_play(bump,,,0.8,,0.8)
											}
										
											timer[0]++

											depth = o_mainchara.depth - 2
											y -= st - (timer[0] * 0.35)
											if trigger = 3 {sf.y = y}
											y += 2
										
											if timer[0] < 20 {trigger = trigger + ((r_pressed() * 0.1) - (l_pressed() * 0.1))}
										
											if dest {
												y = fin
												with (o_mainchara) {
													f = -1
													sprite_index = chopper_c_0
													image_index = 0
													shake(0,2,o_mainchara)
												}
												audio_play(en_hurt_0,,,0.9,,pit)
												audio_play(poing,,,,,(pit - 0.1))
											
												if trigger = 2 {
													sf = instance_create_depth(x,y,depth - 1,o_warnobj)
													sf.sprite_index = stupidfruit
													image_index = 11
													timer[1] = o_mainchara.y
													o_mainchara.y = o_mainchara.y + 10
												}

												if trigger = 3 {
													sf.y = y + 12
													image_index = 10
												}
											
												trigger++
												timer[0] = 0
											}
										break
									
										case 4:
											timer[0]++
										
											x += 8
											y -= 8 - (timer[0] * 0.7)
											sf.x = x
											sf.y = y + 12
											depth = -9999
											sf.depth = depth - 1
								
											switch timer[0] {
												case 60:
													o_mainchara.image_index = 1
													shake(0,1,o_mainchara)
													audio_play(bump,,,0.8,,0.8)
												break
										
												case 90:
													with (o_mainchara) {
														image_index = 0
														f = 0
														y = o_cutsceneobj.timer[1]
														shake(0,1)
														audio_play(bump,,,0.4,,0.7)
													}
												break
											
												case 110:
													trigger = 5
													a = instance_create_depth(0,0,0,dialogue)
													a.char = 0
													a.m[0] = tr("* ... Correction, had, the stupid }fruit.")
													item_delete_name("Stupid Fruit")
												break
											}
										break
									
										case 5:
											if !dial_exists() {end_cuts(13)}
										break
									
										case 2.9:
										case 1.9:
										case 3.1:
										case 2.1:
											var pit = 0.9
											var st = 4

											timer[0]++
											if trigger = 3.1 or trigger = 2.9 {
												st = 5
												pit = 0.8
												sf.y = y
											}
				
											depth = o_mainchara.depth - 2
											y -= st - (timer[0] * 0.35)
											y += 2
										
											if trigger = 3.1 or trigger = 2.9 {
												sf.y = y
												sf.depth = depth - 1
											}
										
											if y >= (o_mainchara.y + o_mainchara.sprite_height) {
												trigger = 6
												image_index = 12
												audio_play(en_hurt_0,,,0.9,,pit)
												shake(0,2)
											}
										
											o_mainchara.image_speed = 0.3
											if timer[1] > 0 {o_mainchara.y = timer[1]}
										
											timer[2]++
										
											if timer[2] >= 10 {
												o_mainchara.image_speed = 0
												o_mainchara.image_index = 0
											
												if trigger = 3.1 or trigger = 2.1 {o_mainchara.f = 1}
												if trigger = 1.9 or trigger = 2.9 {o_mainchara.f = 3}
											}
											else {
												o_mainchara.image_speed = 0.3
											
												if trigger = 3.1 or trigger = 2.1 {
													o_mainchara.f = 3
													o_mainchara.x += 2
												}
										
												if trigger = 1.9 or trigger = 2.9 {
													o_mainchara.f = 1
													o_mainchara.x -= 2
												}
											}
										break
									
										case 6:
											timer[0]++

											if timer[0] >= 60 {
												depth = o_mainchara.depth - 128
												trigger = 7
												timer[0] = 0
												shake(0,1)
												audio_play(battle_begin_0,,,0.9)
												o_mainchara.f = 0
												shake(0,1,o_mainchara)
												image_index = 13
												y = y - 5
											}
										break
									
										case 7:
											timer[0]++
										
											if timer[0] >= 40 {
												if image_index = 13 {
													if i_exists(o_warnobj) {
														global.story[0] = 0
														sf2 = instance_create_depth(0,0,0,o_pickup)
														sf2.spr = stupidfruit
													}
													image_index = 14
												}

												y += 3
											}
										
											if y >= room_height {
												if i_exists(o_warnobj) {
													item_delete_name("Stupid Fruit")
													sf2.x = sf.x
													sf2.y = sf.y
													destroy(sf)
												}
											
												char_free()
												end_cuts(12)
											}
										break
									}
								}
								else {
									if global.story[0] {destroy(c_sf)}
									destroy()
								}
							break
						#endregion
					
						#region ENEMY ENCOUNTERS ROOM
							case rm_gardens11:						
								if global.story[13] < 2 and !antdead {
									sprite_index = ant_cuts
								
									if trigger < 3 {
										g_boabouncy.canjump = 0
										g_boabouncy.cammove = 0
										g_boabouncy.htimer = 0
									
										timer[0]++
									
										var res = choose(irnd_r(10,50),irnd_r(10,50))
										var fram = 16
									
										if trigger = 2 {
											res = 12
										
											if z_hold() {timer[1]++}
											if z_released() and timer[1] >= 20 {
												audio_play(squeak,,,0.7,,rnd_r(0.65,0.75))
												audio_play(poing,,,0.6,,0.8)
												shake(0,2)
												audio_play(battle_begin_0,,,0.5)
												image_index = 20
												timer[0] = 0
												trigger = 4.1
											}

											if timer[0] >= 12 * 3 {fram = 18}
											if timer[0] >= 12 * 5 {fram = 16}
											if timer[0] >= 12 * 7 {
												timer[0] = 0
												image_index = 20
												audio_stop(dial_ant)

												trigger = 3
												
												a = instance_create_depth(0,0,0,dialogue)
												a.char = 0
												a.x_line = 0
												a.can_play = 0
												for (var o = 0;o < 6;o++) {a.m[o] = tr("recuts" + str(o))}
											}
										}

										if timer[0] % res == 0 {audio_play(dial_ant,,,rnd_r(0.45,0.6),0,rnd_r(0.8,1.2))}
									
										image_speed = 0
										image_index = fram + audio_is_playing(dial_ant)
									}

									switch trigger {
										case 0:
											if o_mainchara.bbouncy {
												g_boabouncy.canjump = 0
												g_boabouncy.cammove = 0
												g_boabouncy.htimer = 0
											
												with (o_mainchara) {
													x = g_boabouncy.x + 10
													y = ((g_boabouncy.y - 21) + g_boabouncy.yy)
													o_camera.x = x + 10
													o_camera.y = y + 20
													bpos = 1
												}
											
												depth = g_rock.depth - 1
											
												p0 = instance_create_depth(190,150,depth - 100,o_warnobj)
												p0.sprite_index = poi_0
												p0.image_speed = 0
											
												p1 = instance_create_depth(215,190,depth - 100,o_warnobj)
												p1.sprite_index = poi_0
												p1.image_index = 2
												p1.image_speed = 0
											
												m0 = instance_create_depth(185,220,depth - 100,o_warnobj)
												m0.sprite_index = mace_cuts
												m0.image_index = 3
												m0.image_speed = 0
											
												m1 = instance_create_depth(126,225,depth - 100,o_warnobj)
												m1.sprite_index = mace_cuts
												m1.image_index = 3
												m1.image_speed = 0
												m1.image_xscale = -1
											
												m2 = instance_create_depth(100,160,depth - 100,o_warnobj)
												m2.sprite_index = mace_cuts
												m2.image_index = 2
												m2.image_speed = 0
											
												a0 = instance_create_depth(107,148,depth - 101,o_warnobj)
												a0.sprite_index = ant_cuts
												a0.image_index = 15
												a0.image_speed = 0
											
												trigger = 1
												timer[0] = 0
											}
										break
									
										case 1:
											if o_camera.y > 200 {o_camera.y -= 2}
											else {
												timer[0] = 0
												trigger = 2
											}
										break
									
										case 3:
											if dial_exists() {
												m2.image_index = dialogue.talking_spr * !a.cur_m
												p1.image_index = 2 + (dialogue.talking_spr * a.cur_m > 3)
											
												if !a.cur_m {image_index = 20}
												if a.cur_m = 4 and image_index != 21 {
													shake(0,2)
													audio_play(bump,,,0.8,,0.9)
													a.pitch = 1.1
													image_index = 21
												}
											
												if a.cur_m and a.cur_m < 4 {
													timer[0]++
												
													if timer[0] <= 12 * 3 {image_index = 16 + audio_is_playing(dial_ant)}
													else {image_index = 18 + audio_is_playing(dial_ant)}
												
													if timer[0] >= 12 * 5 {timer[0] = 0}
													if timer[0] % 12 == 0 {audio_play(dial_ant,,,rnd_r(0.45,0.6),0,rnd_r(0.8,1.2))}
												}
											}
											else {
												trigger = 4
												timer[0] = 0
												shake(0,2)
												image_index = 22
												audio_play(ant_s,,,0.8)
											}
										break
									
										case 4:
											timer[0]++
										
											if timer[0] >= 30 {
												if o_camera.y < o_mainchara.y + 20 {o_camera.y += 2}
												else {
													timer[0] = 0
													trigger = 5
													char_free()
													g_boabouncy.canjump = 1
													g_boabouncy.cammove = 1
													o_camera.y = o_mainchara.y + 20
												}
											}
										break
									
										case 5:
											if o_mainchara.y <= 260 and !o_mainchara.encounter and !o_mainchara.c {
												p0.image_index = 5
												p1.image_index = 5
												m0.sprite_index = mace_s
												m0.image_index = 0
												m0.image_xscale = -1
												m0.x += 35
												m1.sprite_index = mace_s
												m1.image_index = 0
												m1.image_xscale = 1
												m1.x -= 35
												m2.sprite_index = mace_s
												m2.image_index = 0
												a0.image_index = 1
												a0.y = 148 - 2
												a0.x = 127
												a0.image_xscale = -1
												image_index = 1
												y++
												x += 8
											
												instance_create_depth(p1.x + 4,p1.y - 10,depth - 102,o_warnobj)
												instance_create_depth(m0.x - 16,m0.y - 5,depth - 102,o_warnobj)
												instance_create_depth(m1.x + 10,m1.y - 5,depth - 102,o_warnobj)

												o_mainchara.enemy = 1
												global.bstory = 2
												global.story[13] = 1
											}
										break
									
										case 4.1:
											timer[0]++
										
											if timer[0] % 2 == 0 {
												o_mainchara.f--
												if o_mainchara.f < 0 {o_mainchara.f = 3}
											}
										
											if o_mainchara.y < g_boabouncy.y + 20 {o_mainchara.y -= round(9 - (timer[0] * 0.38))}
										
											if timer[0] * 0.38 >= 9 {
												if !timer[2] {
													audio_play(ant_s,,,0.8)
													shake(0,2)
													image_index = 23
													timer[2] = 1
												}
											
												if timer[0] >= 35 {
													m0.image_index = 5
													m1.image_index = 5
													m2.image_index = 4
													p0.image_index = 4
													p1.image_index = 4
												}
											
												if timer[0] >= 80 {
													timer[0] = 0
													o_mainchara.y = ((g_boabouncy.y - 21) + g_boabouncy.yy)
													m0.sprite_index = mace_no_1
													m1.sprite_index = mace_no_1
													m2.sprite_index = mace_no_0
													p0.sprite_index = poi_no
													p1.sprite_index = poi_no
													o_warnobj.image_speed = 0.3
													a0.image_speed = 0
													a0.image_index = 15
												
													trigger = 4.2
												}
											}
											else {image_index = 20}
										break
									
										case 4.2:
											timer[0]++
										
											if timer[0] = 30 {image_index = 20}
											if timer[0] = 60 {image_index = 21}
										
											if timer[0] >= 90 {
												timer[0] = 0
												trigger = 3
											}
										break
									}
								}
								else {
									if global.story[13] = 2 or antdead {
										if !timer[3] {
											poilnpc.x = 240
											poilnpc.y = 110

											macnpc.x = 95
											macnpc.y = 225
											macnpc.mask_index = no_spr
										
											sprite_index = ant_2
											x = macnpc.x + 2
											y = macnpc.y - 25
											image_speed = 0.4
											depth = macnpc.depth - 3
											mask_index = no_spr
										
											battleroom()
										
											timer[3] = 1
										}
										else {
											mask_index = no_spr
											macnpc.dir = 2
											depth = macnpc.depth - 3
											macnpc.mask_index = no_spr
											x = macnpc.x
											y = macnpc.y - 19
										
											timer[0]++
										
											macnpc.x += cos(timer[0] / 8)
											x = macnpc.x
										}
									}

									if global.kills > 1 {
										destroy(o_npc)
										battleroom()
										destroy()
									}
								}
							break
						#endregion
					#endregion
				
					#region GARDENS (melody boss)
						case rm_gardensmb:
							switch trigger {
								case 0:
									layer_set_visible("uptiles_2",0)
									layer_set_visible("upassets_2",0)
									layer_set_visible("Tiles_5",0)
							
									if ord_pressed("1") {
										audio_play(lightsout_2,,,,,0.8)
										layer_set_visible("uptiles_2",1)
										layer_set_visible("upassets_2",1)
										layer_set_visible("Tiles_5",1)
										global.allblack = 1
										trigger = 1
									}
								break
							
								case 1:
									var sp = 0.02
	
									g_1plant0.lightalpha -= sp
									g_1plant1.lightalpha -= sp
									g_2plant.lightalpha -= sp
									g_3plant.lightalpha -= sp
									g_tree.lightalpha -= sp
								break
							}
						break
					#endregion
				}
			break
		}
	}
#endregion

#region BATTLE CUTSCENES
	function b_cutscene_code() {

	}
#endregion