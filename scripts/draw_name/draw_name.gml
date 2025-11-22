function draw_name(name = global.pname,limit = 8){
	var nam = name
	var ign = 0
	var igs
	igs[0] = text("IgnoreName")
	
	if !global.changeName {nam = text(name)}
	var dots = "..."
	if l_check() {dots = "…"}

	if array_contains(igs,nam) {ign = 1}

	if !ign {
		if string_length(nam) > limit {
			return string_copy(nam,1,limit) + dots
		}
		else {return nam}
	}
	else {return nam}
}