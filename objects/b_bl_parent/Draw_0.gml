at_stylecode()

if draw {draw_bullet(inBoard)}
if b.scene != 6 {destroy()}

draw_hitbox()

if heartshot {
	switch shot_style {
		default:
			hp -= dmg
		break
	}

	heartshot = 0
}

function draw_bullet(inBoard = 0){
	//i aint gonna repeat the code several times bcus of the drawing inside board system nope

	var h = heart
	var bo = board

	if hp {
		if !inBoard {draw_self()}
		else {
			var l = 0
			var t = 0
			var wi = sprite_width
			var he = sprite_height
			var offx = sprite_xoffset
			var offy = sprite_yoffset
			var ll = (bo.l[1] - x) - offx
			var tt = (bo.u[1] - y) - offy
			var ww = ((x + wi) - bo.r[1]) - 1
			var hh = ((y + he) - bo.d[1]) - 1
			if ll {l += ll}
			if tt {t += tt}
			if ww {wi -= ww}
			if hh {he -= hh}

			wi = round(wi)
			he = round(he)
			l = round(l)
			t = round(t)

			if (wi + offx > 0 and he + offy > 0) and (l < wi and t < he) {
				var wiwi = (wi - l) + offx
				var hehe = (he - t) + offy
				var xx = (x + l) - offx
				var yy = (y + t) - offy
				draw_sprite_part_ext(sprite_index,image_index,l,t,wiwi,hehe,xx,yy,image_xscale,image_yscale,image_blend,image_alpha)
			}
			else {
				if destroyOut {destroy()}
			}
		}
	}
	else {
		audio_play(bomb,,,0.7,,rnd_r(1.1,1.3))
		scr_execute($"{bull}_death")
		destroy()
	}
}
	
function at_stylecode(){
	var col = {
		"-1": #D3D1D1,
		"0": c_white,
		"1": global.lmode ? #42FCFF : #00A2E8,
		"2": #FCA600,
		"3": #40FF40,
		"4": c_red
	}

	image_blend = col[$ str(at_style)] ?? c_white
	if at_style = 3 and global.hard = 2 {destroy()}
}