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
		audio_play(bomb,,,0.7,,random_range(1.1,1.3))

		//this is where you make your custom particles btw, good luck!

		destroy()
	}
}
	
function at_stylecode(){
	switch at_style {
		case -1:
			image_blend = #D3D1D1
		break

		case 0:
			image_blend = c_white
		break
	
		case 1:
			image_blend = #00A2E8
		break
	
		case 2:
			image_blend = #FCA600
		break
	
		case 3:
			image_blend = #40FF40
			if global.hard = 2 {destroy()}
		break
	
		case 4:
			image_blend = c_red
		break
	}
}