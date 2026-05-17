#macro key_map keyboard_get_map

#macro key_hold keyboard_check
#macro key_pressed keyboard_check_pressed
#macro key_released keyboard_check_released

function reset_keys(){
	global.bt = [
		[vk_down,ord("S")],
		[vk_left,ord("A")],
		[vk_up,ord("W")],
		[vk_right,ord("D")],
		[ord("Z"),vk_enter],
		[ord("X"),vk_shift],
		[ord("C"),vk_control]
	]
}

function get_key(k = 0){
	var _k
	
	for (var i = 0;i < 256;i++) {_k[i] = chr(i)}

	_k[9] = "Tab"
	_k[8] = "Backspace"

	_k[12] = "Num 5"
	_k[13] = "Enter"

	_k[16] = "Shift"
	_k[17] = "Control"
	_k[18] = "Alt"
	_k[19] = "Pause"
	_k[20] = "Capslock"
	
	_k[27] = "Escape"

	_k[32] = "Space"
	_k[33] = "Page Up"
	_k[34] = "Page Down"
	_k[35] = "End"
	_k[36] = "Home"
	_k[37] = "Left"
	_k[38] = "Up"
	_k[39] = "Right"
	_k[40] = "Down"

	_k[45] = "Insert"
	_k[46] = "Delete"

	_k[91] = "Windows"
	
	_k[93] = "Context Menu"

	_k[96] = "Num 0"
	_k[97] = "Num 1"
	_k[98] = "Num 2"
	_k[99] = "Num 3"
	_k[100] = "Num 4"
	_k[101] = "Num 5"
	_k[102] = "Num 6"
	_k[103] = "Num 7"
	_k[104] = "Num 8"
	_k[105] = "Num 9"
	_k[106] = "Num *"
	_k[107] = "Num +"
	_k[109] = "Num -"
	_k[110] = "Num ."
	_k[111] = "Num /"
	_k[112] = "F1"
	_k[113] = "F2"
	_k[114] = "F3"
	_k[115] = "F4"
	_k[116] = "F5"
	_k[117] = "F6"
	_k[118] = "F7"
	_k[119] = "F8"
	_k[120] = "F9"
	_k[121] = "F10"
	_k[122] = "F11"
	_k[123] = "F12"

	_k[144] = "NUMLOCK"

	_k[173] = "Mute"
	_k[174] = "Volume Down"
	_k[175] = "Volume Up"

	_k[186] = ";"
	_k[187] = "="
	_k[188] = ","
	_k[189] = "-"
	_k[190] = "."
	_k[191] = "/"
	_k[192] = "'"

	_k[219] = "["
	_k[220] = chr(220)
	_k[221] = "]"
	_k[222] = "\ "

	_k[223] = "`"
	
	_k[160] = "L-Shift"
	_k[161] = "R-Shift"
	_k[162] = "L-Control"
	_k[163] = "R-Control"
	_k[164] = "L-Alt"
	_k[165] = "R-Alt"

	return tr(_k[k])
}