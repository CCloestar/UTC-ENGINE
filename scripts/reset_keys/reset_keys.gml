function reset_keys(){
	global.bt[0,0] = vk_down
	global.bt[0,1] = ord("S")
	
	global.bt[1,0] = vk_right
	global.bt[1,1] = ord("D")
	
	global.bt[2,0] = vk_up
	global.bt[2,1] = ord("W")
	
	global.bt[3,0] = vk_left
	global.bt[3,1] = ord("A")
	
	global.bt[4,0] = ord("Z")
	global.bt[4,1] = vk_enter
	
	global.bt[5,0] = ord("X")
	global.bt[5,1] = vk_shift
	
	global.bt[6,0] = ord("C")
	global.bt[6,1] = vk_control
}