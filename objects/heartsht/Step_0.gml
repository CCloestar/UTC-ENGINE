if shot = 1 {
	image_alpha += 0.2
<<<<<<< HEAD

=======
	
>>>>>>> 1731812de1943c5c91ceee1a0fc43738ca29353e
	if image_xscale < 1 {image_xscale += 0.2}
	if image_yscale < 1 {image_yscale -= 0.2}
}

switch style {
	default:
		if y < -100 or place_meeting(x,y,b_bl_parent) {
			if i_exists(b_bl_parent) {b_bl_parent.dmg = dmg}
			destroy()
		}
<<<<<<< HEAD

=======
>>>>>>> 1731812de1943c5c91ceee1a0fc43738ca29353e
		image_yscale += 0.2
		vspeed -= 0.2
	break
}