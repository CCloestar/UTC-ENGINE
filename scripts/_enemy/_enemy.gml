function load_enemy(){
	var b = battle_globals

	#region DEFAULT SETUPS
		spr = [
			[sprite_index,0], //HURT
			[sprite_index,0], //SPARE
			[sprite_index,0], //DEAD
			[sprite_index,1] //IDLE
		]

		hurtsnd = en_hurt_0
		sparehurt = 1

		shake_return = 15
		v_speed = 2
		v_speed_ex = 0
		can_at = 1
		shakef = 8
		wide_dust = 1
		d_spr = 1
		d_col = 1
	#endregion

	scr_execute($"en_{_id}_{global.curCh}")
	if name[1] = "" {name[1] = $"en{_id}"}

	if d_spr {
		for (var i = 0;i < arlen(spr);i++) {spr[i,0] = sprite_index}
		image_index = 1
	}

	if d_col {
		for (var i = 0;i < arlen(a);i++) {a[i,2] = c_white}
	}

	image_xscale = 2
	image_yscale = 2
	xstart = x
	ystart = y
	for (var i = 0;i < arlen(a);i++) {a[i,1] = 0}
}

function draw_deadspr(dead = 0) {
	var frs = [
		[spr[2,0],spr[2,1]],
		[spr[1,0],spr[1,1]]
	]

	sprite_index = frs[dead,0]
	image_speed = 0
	image_index = frs[dead,1]
	x = xstart
	y = ystart

	draw_surface(self.surf,x,y)

	surface_set_target(self.surf)
	draw_self()
	surface_reset_target()

	self.surf_spr = sprite_create_from_surface(self.surf,x,y,sprite_width,sprite_height,1,0,0,0)
	surface_free(self.surf)

	visible = dead
	part_death()
}

function part_death(){
	for (var p = 0;p < arlen(self.part);p++) {
		switch self.part[p].n {
			default:
				destroy(self.part[p])
			break
		}
	}
}

function part_visible(vis = 0){
	for (var p = 0;p < arlen(self.part);p++) {
		if i_exists(self.part[p]) {self.part[p].visible = vis}
	}
}

function part_reset() {
	for (var p = 0;p < arlen(self.part);p++) {
		if i_exists(self.part[p]) {
			with (self.part[p]) {
				x = xstart
				y = ystart
				image_angle = an
				image_xscale = sc[0]
				image_yscale = sc[1]
				image_blend = c
				image_alpha = al
			}
		}
	}

	timers_reset()
}

function create_bubble(){
	for (var i = 0;i < enAmt;i++) {
		with (en[i]) {
			var bbt = [
				[x + sprite_width - 6,y,depth - 2],
				[dial_main,1,1],
				["^wdummy&&longtext&&verylong&&text",2,0]
			]

			if scr_exists($"{name[1]}_bubbleData") {bbt = scr_execute($"{name[1]}_bubbleData")}

			if dead = 0 {
				bb = dial_create(bbt[0,0],bbt[0,1],bbt[0,2])

				with (bb) {
					preset = 2
					dw = 0
					finish = 0
					snd = bbt[1,0]
					vol = bbt[1,1]
					pit = bbt[1,2]
					m = (arlen(bbt[2,0]) > 0) ? bbt[2,0] : [bbt[2,0]]
					fnt = bbt[2,1]
					bubble = bbt[2,2]
				}	
				
				print($"ENEMY {i} HEARD {heard}")
				scr_execute($"{name[1]}_dial")
			}
		}
	}
}

function act_dial(){
	a = dial_create(52,278)
	a.preset = -1
	a.sound = dial_alt
	var e = en[curIt]

	if curAct {
		var txt = $"b_{e.name[1]}_{curAct - 1}_{e.a[curAct - 1,1]}"
		a.m = [tr(txt)]
		a.bm = txt
		
		print($"I WILL NOW LOAD... \"{e.name[1]}_act\"")
		scr_execute($"{e.name[1]}_act")
	}
	else {a.m = [e.desc]}
}