function c_rm_demo1announce_1(){
	var _d = o_warnobj
	var _w = 0
	
	o_mainchara.visible = 0
	cam_pos(x + 10,y)
	
	switch trigger[0] {
		case 0:
			audio_free()

			if !i_exists(_d) {
				_d = i_create(340,180,0,o_warnobj)
				x = _d.x
				y = _d.y
			}
			
			_w = 1
			x -= 2

			if x <= 150 {
				x = 150
				
				_w = 0
				timer[0]++
				
				if timer[0] >= 40 {
					a = dial_create(140,60,0)
					a.preset = -1
					a.snd = -1
					a.m = ["Bark. "]
					a.auto_punc = 0

					cam_resize(,0.25,0.25)

					audio_play(dog_bark,,,,,1.1)
					timers_reset()
					trigger[0] = 1
				}
			}
		break
		
		case 1:
			if !dialogue.draw {
				destroy(a)
				cam_resize()
				
				a = dial_create(140,60,0)
				a.preset = -1
				a.m = [
					"Hello, it is I. NeatPuppy.&&Aka ClovesCloestar.&&Aka the guy who made this&&video  game.",
					"It's been a while, hasn't&&it? Hell yeah it was.",
					"It's been like 3 YEARS&&since the last UNDERTALE&&CYAN video, but why? &&Why SO MUCH time?",
					"Why it's pretty easy to&&explain, actually!",
					"...",
					"... Okay, no. You probably&&already know why.",
					"Yada yada personal life,&&other projects yada yada",
					"Blah blah I've seen this&&countless of times!!!",
					"So I'll cut this short.",
					"Aside from the normal&&reasons due to me&&being diagnosed with&&HavingALifeitus...",
					"I was working, reworking,&&thinking, crying,&&rethinking, crying again.",
					"All of that for this&&game and its engine!",
					"That's right, I am also&&talking about Engines here.",
					"You may or not know&&this, but...",
					"THIS GAME HAS A PUBLIC~A &&GAME MAKER 2 ~WENGINE!!!",
					"YOU. YES, YOU! CAN MAKE&&A GAME LIKE~S &&UNDERTALE CYAN~W!!!",
					"OVERWORLD SYSTEM!!!&&CUSTOM TITLE SYSTEM!!!",
					"BATTLES!!!!!!!!!!!&&FULL CUTSCENES!!!!!!!!!!",
					"... Explanation section&&for your silly youtube&&preview...?",
					"With the knowledge of&&GAME MAKER STUDIO 2's&&language, YOU can make&&that fateful ~OUNDERTALE&&ORANGE~W you so wanted&&to make!!!",
					"... Wait, you DON'T&&want to make ~OORANGE? ~W &&OKAY! Make it CYAN then! &&Make your OWN~S &&UNDERTALE CYAN~W!",
					"That sweet sweet~Y &&DOWNLOAD LINK~W is in&&the video's description."
				]

				music_play("dance_of_dog")
				trigger[0] = 2
			}
		break
		
		case 2:
			if dial_exists() {
				switch a.cur_m {
					case 4:
						music_vol(,music_vol(,-1) - 0.025)
						
						if music_vol(,-1) <= 0 {music_stop()}
					break
					
					case 6:
						audio_free()
						_w = 1
						timer[0] = x
						timer[1] = y
					break
					
					case 19:
					case 7:
						cam_resize()
					
						timer[2]++
					
						if timer[2] % 2 == 0 {
							x = timer[0] + irnd_r(-2,2)
							y = timer[1] + irnd_r(-2,2)
						}
						
						_w = 1.5
					break
					
					case 8:
						x = timer[0]
						y = timer[1]
						timer[2] = 0
					break
					
					case 11:
					case 10:
					case 9:
						timers_reset()
						trigger[0] = 2
						_w = 1
					break

					case 15:
					case 14:
						if timer[0] != a.cur_m - 13 {
							var _f = a.cur_m * (a.cur_m - 12)
							
							audio_play(tensebam,,,,,(a.cur_m / 10))
							cam_resize(,0.5,0.5,cam_width(),cam_height())
							
							timer[0] = a.cur_m - 13
						}
						
						_w = (a.cur_m / 10) - 0.3
					break
					
					case 17:
					case 16:
						if !music_is_playing() {music_play("thrash_rating")}
						cam_resize()
						
						_w = (a.cur_m / 10) - 0.3
						timer[1] += (a.cur_m - 15)
						y -= 4 - (timer[1] * 0.2)
						
						if y >= 180 {
							y = 180
							timer[1] = 0
						}
					break
					
					case 18:
						cam_resize(,1.5,1.5)
						y = 180
						timer[0] = x
						timer[1] = y
					break
					
					case 20:
						_w = 1
					break
					
					case 21:
						cam_resize(0.25,0.25)
					break
				}
			}
			else {
				music_stop()
				cam_resize()

				a = dial_create(140,60,0)
				a.preset = -1
				a.m = [
					"Now let us return to&&UNDERTALE CYAN itself,&&shall we?",
					"Since that preview video,&&I have changed,&&UNDERTALE CYAN has changed.",
					"Lots of things from this&&video behind closed&&doors have changed&&quite alot.",
					"This means that story,&&sprites, vision,&&literally everything&&changed for this game.",
					"You can already notice&&some small, yet meaningful&&changes in the RUINS section.",
					"Compared to the old&&RUINS preview, it has&&text corrections,&&slight pacing changes,&&more player freedom,&&etc etc.",
					"Some of those changes&&are unseen in both&&versions, though.",
					"That's because I want YOU&&to experience this&&game in your OWN&&way at its fullest!",
					"Now, I will talk all the&&previous questions I've&&already awnsered,&&as well as new ones&&that might come...",
					"~R1. ~WIs UNDERTALE YELLOW canon&&to UNDERTALE CYAN?",
					"Not anymore!",
					"",
					"Wait, wait! There's no big&&personal reason as to&&why this game isn't&&canon to UNDERTALE YELLOW's&&story! I can explain...",
					"Basically, UNDERTALE CYAN&&has plot threads, points, etc&&that conflicts with UTY's,&&but benefits itself in&&many ways.",
					"Since UNDERTALE YELLOW&&is a fan-game and not the&&real deal like UNDERTALE,&&this means we won't use UTY&&as canon to UNDERTALE CYAN.",
					"I know I said it would&&be left ambiguous, but now&&it's definitely a no, sorry!",
					"We will only use UNDERTALE&&and it's ~Y10th Anniversary~W &&content, alongside with small &&changes similar to UTY's&&for a better, unique&&experience.",
					"Changes include: NEW AREAS&&like The Gardens...",
					"... That's it? &&Odd, I remember something&&about more lore for waterf^F",
					"~B3. ~WWait, does that mean&&UTC isn't Canon Complaint!? &&What the hell I want&&my wholesome tobycore!!1!?",
					"UNDERTALE CYAN was once&&planned to be Canon&&Complaint, ONCE. ",
					"But we won't aim for that&&anymore.&&You're free to not follow&&this project anymore if this&&doesn't apply to your tastes.",
					"~Y4. ~WIs FLOWEY here?",
					"Nah, he's not here-",
					"* Oh boy!&&* I heard someone&&  called for their pal!",
					"...",
					"* ...",
					"Wrong game bro",
					"* Yeah, I got it&&  already.",
					"",
					"~p5. ~WWait, if the lore&&changed... WHAT WILL HAPPEN&&TO THE TOY KNIFE AND&&FADED RIBBON?!!? WHERE&&ARE THEM!?!? THERE AIN'T&&NO TOY KNIFE HERE&&THIS GAME SUCKS!",
					"Well, BUDDY.",
					"First of all,~R &&YOU ~WSUCK!",
					"That was rude, don't&&make me angry.&&You don't wanna&&see me angry.",
					"Second of all, Toy Knife&&and Faded Ribbon will&&be explored differently.",
					"Can't say how it will&&happen yet due to&&spoilers, so play our&&game until it finishes to&&find out!",
					"~A6. ~WWith the lore changes, &&does this means we will &&get more characters &&from base UNDERTALE?",
					"UNDERTALE CYAN will &&feature 2 Goats, &&some frogs,~Y &&maybe ~Wa turtle and &&then full original cast.",
					"7. Wait, if it's not&&strictly canon accurate, &&does this mean there &&will be Sans and Papyrus and &&they will fight Gaster &&because he was manipulated &&by Chara and then &&Chopper and Toriel have &&to gather the 6 human souls &&from the future by burning &&through time (like in Sonic CD) &&then they have to fight &&the onnipotent Chara-Gaster &&amalgam and then everyone &&have a dance party at the &&end and can I be a writer or &&otherwise apply to this &&project?",
					"8. Unrelated to &&UNDERTALE CYAN but this &&explanation part kinda &&looks like UNDERTALE: HARD &&MODE Director's Cut's &&QnA video ngl",
					"[&%@!], I gotta go. &&The chipmunk is here.",
					"Don't tell him I stole &&his video...!",
					"",
					"...",
					"Y'know, while I was &&running...",
					"I just realised &&something was... off.",
					"Yeah... Yeah! I forgot to &&awnser Question 2!",
					"Let's see...",
					"~G2. ~WWill TORIEL follow you &&after the RUINS "
				]
				a.play = 0
			
				timers_reset()
				trigger[0] = 3
			}
		break
		
		case 3:
			if dial_exists() {
				switch a.cur_m {
					case 1:
						if !music_is_playing() {music_play("menu_4_cyan")}
					break
					
					case 37:
					case 36:
					case 35:
					case 34:
					case 10:
					case 9:
					case 7:
						_w = 1
					break
					
					case 11:
						music_vol(,music_vol(,-1) - 0.025)
						if music_vol(,-1) <= 0 {music_pause()}
					break
					
					case 12:
						music_vol(,1)
						music_resume()

						cam_resize()
						_w = 1
					break
					
					case 16:
					case 14:
					case 13:
						_w = 1
					break
					
					case 18:
						a.next_m = !a.draw
						
						timer[0] = x
						timer[1] = y
						music_pause()
					break
					
					case 30:
					case 19:
						music_resume()
						if image_xscale = -1 {
							image_xscale = 1
							x -= 10
						}
					
						timer[2]++
					
						if timer[2] % 2 == 0 {
							x = timer[0] + irnd_r(-2,2)
							y = timer[1] + irnd_r(-2,2)
						}
						
						_w = 1.5
					break
					
					case 20:
						x = timer[0]
						y = timer[1]
					break
					
					case 22:
						_w = 1
					break
					
					case 23:
						if !a.draw {
							a.next_m = 1
							a.snd = dial_flow_0
							music_pause()
							music_play("flowey",,,,,0)
							
							_d.x = x + 20
							_d.y = y - 5
							_d.sprite_index = flowey
							_d.image_speed = 0.5
							
							image_xscale = -1
							x += 10
							
							shake(0,2,,1)
							audio_play(dog_bark,,,,,1.2)
						}
					break
					
					case 24:
						if _d.image_index >= 3 {
							_d.image_speed = 0
							_d.image_index = a.talkfr + 3
						}
					break
					
					case 28:
					case 27:
					case 26:
					case 25:
						var _ds = [dial_main,dial_flow_0,dial_main,dial_flow_0]
					
						a.snd = _ds[a.cur_m - 25]
						_d.image_speed = 0
						if a.snd = dial_flow_0 {_d.image_index = a.talkfr + 3}

						music_pitch(global.music[0],music_pitch(global.music[0],-1) - 0.01)
						if music_pitch(global.music[0]) <= 0 {music_stop(0)}
					break
					
					case 29:
						if i_exists(_d) {
							if _d.image_index < 5 {_d.image_index = 5}
							_d.image_speed = 0.5
							if _d.image_index >= 9 {destroy(_d)}
						}
						
						a.snd = dial_main
						
						timer[0] = x
						timer[1] = y
					break
					
					case 31:
						x = timer[0]
						y = timer[1]
						
						cam_resize(,0.5,0.5)
						destroy(_d)
						music_stop(0)
					break
					
					case 32:
						cam_resize(,0.25,0.25)
					break
					
					case 33:
						cam_resize()
					break
					
					case 38:
						_w = 1
					
						if a.length >= 205 {
							_w = 2
							x += 5

							if x >= 285 {
								x = 285
								_w = 0
							}
							
							music_pitch(,music_pitch(,-1) - 0.002)
						}
						
						if a.length >= 320 {
							y--
							a.y -= 2
						}
						
						if !a.draw {
							music_pause()
							audio_play(dog_bark,,,,,0.9)

							i_create(room_width,(room_height / 2) + 30,-100,text_obj)
							with (text_obj) {
								c[0] = c_white
								c[1] = c_black
								valign = fa_middle
								halign = fa_center
								image_angle = 4
								image_xscale = 20
								image_yscale = 20
								txt = "NO"
								gui = 1
								_id = 7
								shake(0,3,,1)
							}

							trigger[0] = 4
						}
					break
				}
			}
		break
		
		case 4:
			if dial_exists() {
				switch a.cur_m {
					case 38:
						if !audio_is_playing(dog_bark) {a.next_m = 1}
					break
					
					case 39:
						a.y = 60
						destroy(text_obj)
						x = timer[0]
						y = timer[1]

						music_pitch(,1)
						music_resume()
						_w = 1
						
						if a.length >= 85 {
							if !i_exists(_d) {
								_d = i_create(-30,172,depth + 2,o_warnobj)
								with (_d) {
									sprite_index = chi
									image_speed = 1.1
									image_alpha = 0.5
								}
							}
							
							_d.x += 10
							
							if _d.x >= x {
								if o_mainchara.c = 1 {
									i_create(x + 2,y - 12,,o_box)
									o_box.sprite_index = caution
									o_box.image_speed = 0
									o_mainchara.c = 2
								}

								music_pitch(,1.3)
								_w = 0
							}
						}
						
						if !a.draw {
							destroy(o_warnobj)
							destroy(o_box)
							a.next_m = 1
						}
					break
					
					case 41:
					case 40:
						timer[2]++
					
						if timer[2] % 2 == 0 {
							x = timer[0] + irnd_r(-2,2)
							y = timer[1] + irnd_r(-2,2)
						}
					
						_w = 2
					break
					
					case 42:
						if image_alpha {
							x = timer[0]
							y = timer[1]
							
							var _bb = b_runner
							
							i_create(,,,b_runner)
							_bb.sprite_index = sprite_index
							_bb.image_index = image_index
							_bb.pos = -8
							_bb.sca = 1
							
							image_alpha = 0
							image_xscale = -1
							image_angle = -12
						}
						
						if !i_exists(b_runner) {
							audio_free()
							timer[3]++
							
							if timer[3] >= 80 {
								x = -15
								y = 180
								a.next_m = 1
							}
						}
					break
					
					case 43:
						image_alpha = 1
						x++
						
						if x >= 15 {x = 15}
					break
					
					case 46:
					case 45:
						if image_angle < 0 {image_angle++}
						else {image_angle = 0}

						x += 2
						_w = 1
						
						if x >= 170 {x = 170}
					break
					
					case 47:
						image_xscale = 1
						x = 150
						y = 180
					break
					
					case 48:
						_w = 1
						
						if !a.draw {
							destroy(a)
							image_alpha = 0
							
							for (var i = 0;i < 5;i++) {et[i] = i_create(room_width,124 + (30 * i),-100,text_obj)}

							with (text_obj) {
								c[0] = c_white
								halign = fa_center
								image_xscale = 1.5
								image_yscale = 1.5
								gui = 1
							}

							et[0].txt = "Check out UNDERTALE CYAN progress in"
							et[1].txt = "[https://gamejolt.com/games/undertalechopper/922314]"
							et[2].txt = "(Link is in the description aswell!)"
							et[3].txt = "Next Preview Video will be released when..."
							et[4].txt = "Demo 1 Releases. Stay patient."
							
							et[1].c[0] = global.color[0]
							
							for (var i = 3;i < 5;i++) {
								et[i].al = 0
								et[i].y = 325 + (30 * (i - 3))
							}
							
							audio_play(UT_0)
							timers_reset()
							trigger[0] = 5
						}
					break
				}
			}
		break
		
		case 5:
			timer[0]++

			if timer[0] < 280 {
				if timer[0] >= 120 {et[3].al += 0.05}
				if timer[0] >= 200 {et[4].al += 0.05}
			}
			else {text_obj.al -= 0.05}
		break
	}
	
	cam_pos(x + 10,y)
	
	if _w > 0 {
		sprite_index = pup_0
		image_speed = _w
	}
	else {
		sprite_index = pup_1
		image_index = 0
		image_speed = 0
	}
}