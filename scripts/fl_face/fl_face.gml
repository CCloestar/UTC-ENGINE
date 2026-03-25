function fl_face(_face = o_mainchara.f){
	if i_exists(o_follower) {
		with (o_follower) {
			f = _face
			
			for (var i = 0;i < fl;i++) {_f[i] = _face}
		}
	}
}