function get_key(key = 0){
	var _key
	
	for (var i = 0;i < 256;i++) {_key[i] = chr(i)}

	_key[9] = "Tab"
	_key[8] = "Backspace"

	_key[12] = "Num 5"
	_key[13] = "Enter"

	_key[16] = "Shift"
	_key[17] = "Control"
	_key[18] = "Alt"
	_key[19] = "Pause"
	_key[20] = "Capslock"
	
	_key[27] = "Escape"

	_key[32] = "Space"
	_key[33] = "Page Up"
	_key[34] = "Page Down"
	_key[35] = "End"
	_key[36] = "Home"
	_key[37] = "Left"
	_key[38] = "Up"
	_key[39] = "Right"
	_key[40] = "Down"

	_key[45] = "Insert"
	_key[46] = "Delete"

	_key[91] = "Windows"
	
	_key[93] = "Context Menu"

	_key[96] = "Num 0"
	_key[97] = "Num 1"
	_key[98] = "Num 2"
	_key[99] = "Num 3"
	_key[100] = "Num 4"
	_key[101] = "Num 5"
	_key[102] = "Num 6"
	_key[103] = "Num 7"
	_key[104] = "Num 8"
	_key[105] = "Num 9"
	_key[106] = "Num *"
	_key[107] = "Num +"
	_key[109] = "Num -"
	_key[110] = "Num ."
	_key[111] = "Num /"
	_key[112] = "F1"
	_key[113] = "F2"
	_key[114] = "F3"
	_key[115] = "F4"
	_key[116] = "F5"
	_key[117] = "F6"
	_key[118] = "F7"
	_key[119] = "F8"
	_key[120] = "F9"
	_key[121] = "F10"
	_key[122] = "F11"
	_key[123] = "F12"

	_key[144] = "NUMLOCK"

	_key[173] = "Mute"
	_key[174] = "Volume Down"
	_key[175] = "Volume Up"

	_key[186] = ";"
	_key[187] = "="
	_key[188] = ","
	_key[189] = "-"
	_key[190] = "."
	_key[191] = "/"
	_key[192] = "'"

	_key[219] = "["
	_key[220] = chr(220)
	_key[221] = "]"
	_key[222] = "\ "

	_key[223] = "`"
	
	_key[160] = "L-Shift"
	_key[161] = "R-Shift"
	_key[162] = "L-Control"
	_key[163] = "R-Control"
	_key[164] = "L-Alt"
	_key[165] = "R-Alt"

	return text(_key[key])
}