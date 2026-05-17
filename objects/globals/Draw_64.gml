if global.init = -2 {exit}

var q = [is_web() ? tr("Restarting") : tr("Quitting"),"",0,0]
var j = l_check()

switch global.gamemode {
	default:
		var pr = (key_hold(vk_escape) or (on_controller() and gamepad_button_check(gpad._gpad,gp_start)))
		quit += pr
		quit *= pr

		if quit {q[2] = floor(quit / 12.5) % 3}
		if quit >= 20 {
			if is_web() {game_restart()}
			else {game_end()}
		}

		if q[2] % 3 == 1 {q[1] = j ? "…" : "."}
		if q[2] % 3 == 2 {q[1] = j ? "……" : ".."}

		q[3] = clamp(quit / 9.5,0,0.9)

		draw_font(4 * !j)
		if !j {draw_txt_outline(2,2,str_u(q[0]) + q[1],c_white,,q[3],q[3],,2,,1)}
		else {
			for (var i = 0;i < strlen(q[0] + q[1]);i++) {draw_txt_outline(2 + (13 * i),7,strchr(q[0] + q[1],i + 1),c_white,,q[3],q[3],,1,,1)}
		}
	break
}