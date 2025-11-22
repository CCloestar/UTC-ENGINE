function draw_font(fnt = 0,subfnt = -1){

	/*
		REFERENCE FOR CHANGING FONTS
		
		FONT 0,0 = BATTLE
		FONT 0,1 = BATTLE (JP)
		FONT 1,0 = MENU
		FONT 1,1 = MENU (JP)
		FONT 2,0 = DIALOGUE
		FONT 2,1 = DIALOGUE (JP)
		FONT 3,0 = DESC
		FONT 3,1 = DESC (JP)
		FONT 4,0 = MARS
		FONT 5,0 = HURT
		FONT 6,0 = UNDERTALE LOGO
		FONT 7,0 = HP
		FONT 7,1 = HP (MORE SPACED)
		FONT 8,0 = SANS
		FONT 9,0 = PAPYRUS
		FONT 10,0 = WINGDINGS
		FONT 11,0 = CONTROL TEST EXIT
		FONT 12,1 = JAPANESE (MORE SPACED)
	*/

	if subfnt < 0 {
		var jpcheck = l_check() * (fnt < 3)

		return draw_set_font(global.FONT[fnt,jpcheck])
	}
	else {return draw_set_font(global.FONT[fnt,subfnt])}
}