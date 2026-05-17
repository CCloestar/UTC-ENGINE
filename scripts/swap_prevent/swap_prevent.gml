function swap_prevent(dw = 0){
	var swap,cc
	swap = 0
	cc = 0

	var wep = [""]
	var arm = [""]
	
	if array_contains(wep,global.wep[cc,dw]) {swap = 1}
	if array_contains(arm,global.arm[cc,dw]) {swap = 1}

	return swap
}