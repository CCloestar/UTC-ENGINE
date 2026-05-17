function load_langs(){
	var list = $"{working_directory}lang/langList.ini"
	var l = ["en"]
	if global.lang = -1 {global.lang = d_lang()}
	
	global.fntf = 0

	if f_exists(list) {
		ini_open(list)
			var f = 1

			for (var i = 0;i < f;i++) {
				if ikey_exists("list",$"{i}") {
					l[i] = load_str($"{i}",,"list")

					f++
				}
			}

			global.fntf = load_real($"{global.lang}f",,"list")
		ini_close()
	}
	else {print($"{list} Doesn't exist!")}

	var c = "config.ini"

	if f_exists(c) {
		ini_open(c)
			global.fntf = load_real("fntForm",global.fntf,c)
		ini_close()
	}

	if global.lang > arlen(l) - 1 {global.lang = 0}
	if global.lang < 0 {global.lang = arlen(l) - 1}
	
	var ll = l[global.lang]

	if variable_global_exists("l_map") {delete global.l_map}
	
	list = $"{working_directory}lang/lang_{str_l(ll)}.json"
	list = !f_exists(list) ?  $"{working_directory}lang/lang_en.json" : list

	global.l_map = js_load(list)

	if variable_global_exists("l_spr") {
		for (var i = 0;i < arlen(global.l_spr);i++) {spr_del(global.l_spr[i])}
		for (var i = 0;i < arlen(global.l_snd);i++) {audio_destroy(global.l_snd[i])}
	}

	global.l_spr = []
	global.l_snd = []
	
	global.l_sp = {}
	global.l_sn = {}

	load_lang_spr("en")
	load_lang_sfx("en")

	if !l_check("US") {
		load_lang_spr(ll)
		load_lang_sfx(ll)
	}
	
	print(global.l_spr)
	print(global.l_snd)

	load_fonts()
}
	
function d_lang() {
	var dl = [{"en": 0,"ja": 1}]

	var cc = (global.curCh > arlen(dl) - 1) ? 0 : global.curCh
	return (dl[cc][$ os_get_language()] ?? 0)
}

function load_lang_spr(l = "en") {
	var list = $"{working_directory}lang/langList.ini"
	var _l = str_l(l)

	if f_exists(list) {
		ini_open(list)
			var f = 1
			
			for (var i = 0;i < f;i++) {
				if ikey_exists("sprites",$"{i}_n") {
					var _n = load_str($"{i}_n",,"sprites")
					var _f = load_real($"{i}_f",,"sprites")
					var _b = load_real($"{i}_b",,"sprites")
					var _s = load_real($"{i}_s",,"sprites")
					var xx = load_real($"{i}_x",,"sprites")
					var yy = load_real($"{i}_y",,"sprites")

					var loc = $"{working_directory}lang/sprites/"
					var nam = $"{_n}_{_l}"
					var spr = $"{loc}{nam}.png"

					if !f_exists(spr) {
						spr = $"{loc}{_n}_en.png"
						nam = $"{_n}_en"
					}

					if !f_exists(spr) {
						spr = $"{loc}{_n}.png"
						nam = _n
					}

					if f_exists(spr) {
						var _sp = spr_add(spr,_f,_b,_s,xx,yy)
						
						arpush(global.l_spr,_sp)
						struct_set(global.l_sp,nam,_sp)
						print($"ADDED LANG SPRITE: {nam},{_f},{_b},_{_s},{xx},{yy}")
					}

					f++
				}
			}
		ini_close()
	}
	else {print($"{list} Doesn't exist!")} 
}

function load_lang_sfx(l = "en") {
	var list = $"{working_directory}lang/langList.ini"
	var _l = str_l(l)

	if f_exists(list) {
		ini_open(list)
			var f = 1
			
			for (var i = 0;i < f;i++) {
				if ikey_exists("sfx",$"{i}") {
					var _n = load_str($"{i}",,"sfx")
					var loc = $"{working_directory}lang/audio/"
					var nam = $"{_n}_{_l}"
					var snd = $"{loc}{nam}.ogg"

					if !f_exists(snd) {
						snd = $"{loc}{_n}_en.ogg"
						nam = $"{_n}_en"
					}

					if !f_exists(snd) {
						snd = $"{loc}{_n}.ogg"
						nam = _n
					}

					if f_exists(snd) {
						var sfx = audio_create(snd)

						arpush(global.l_snd,sfx)
						struct_set(global.l_sn,nam,sfx)
						print($"ADDED LANG SOUND: {nam}")
					}

					f++
				}
			}
		ini_close()
	}
	else {print($"{list} Doesn't exist!")} 
}

function load_fonts() {
	var l = $"{working_directory}lang/fonts/fontList.ini"
	
	if variable_global_exists("fnt") {
		for (var i = 0;i < arlen(global.fnt);i++) {
			if font_exists(global.fnt[i]) {font_delete(global.fnt[i])}
		}
	}
	
	if variable_global_exists("lfnt") {
		for (var i = 0;i < arlen(global.lfnt);i++) {
			if font_exists(global.lfnt[i]) {font_delete(global.lfnt[i])}
		}
	}
	
	global.fnt = []

	if f_exists(l) {
		ini_open(l)
			var _f = 1
			
			for (var i = 0;i < _f;i++) {
				if ikey_exists("list",$"{i}") {
					load_font(i,load_str($"{i}",,"list"))

					_f++
				}
			}
		ini_close()
	}
	else {print($"{l} Doesn't exist!")}

	global.lfnt[0] = font_add_sprite_ext(UT_bitmap,"abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ",1,6)
	reload_memory()
}

function load_font(f = 0,_f = "main_0") {
	var loc = $"{working_directory}lang/fonts/"
	var l = $"{loc}{_f}"
	var fn = [_f,_f]

	var siz = 12
	var add = 1

	var lan = (tr_l("lang") = undefined) ? "en" : tr_l("lang")
	if l_check() {lan = "ja"}

	if f_exists($"{l}_{lan}.ttf") or f_exists($"{l}_{lan}.otf") {
		l += $"_{lan}"
		fn[0] += $"_{lan}"
		fn[1] += $"_{lan}"
	}
	if l = $"{loc}main_1" and lan = "ja" {l = $"{loc}main_0_ja"}
	if l = $"{loc}main_0_ja" {siz = 10.5}
	if l = $"{loc}dial" and lan = "ja" {
		global.fnt[f] = font_add_sprite_ext(JAP_bitmap," !\"#$%&'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[¥]^_‘abcdefghijklmnopqrstuvwxyz{|}⁻´Д-―❝❞…※←→∀∞☆♪、。々「」『』【】ぁあぃいぅうぇえぉおかがきぎくぐけげこごさざしじすずせぜそぞただちぢっつづてでとどなにぬねのはばばひびぴふぶぷへぺぺほぼぽまみむめもゃやゅゆょよらりるれろゎわゐゑをん“゜ァアィイゥウェエォオカガキギクグケゲコゴサザシジスズセゼソゾタダチチッツヅテデトドナニヌネノハバパヒビピフププへヘベペホボポマミムメモャヤュユョヨラリルレロヮワヰヱヲンヴォヵヶ•ー一七三上下不世並中予争事二交人今他伏位体何作使例係促個倒健備優元兄先光入全八共写处出分列初判別到前力加勇動勝化北匹十印原去参及友取受口可史合同名向呪味呼命咲品四回団困図国圧在地坊型場壊士変外大天失奏奧奪女始威子字存学完定宝実室家対封導小局届屋山岩崩差市師幅年底店度康廊式弱強弹当彼待後得復心必忍念怖思急怪恐悟恶情惑意愚感懸成我戦戻所扉手才打払抗抜択抱押担拍持指挑捨掃提撃操攻故敗数敵文新方族曰｜日早明時景更書最月望期木未末本東果校根案植極機次歩歯歴死殊残段民気水永求決況法注活派浴海消深淵済涉満滅漢火灰災点無然照爆版物特犬犯状独獲王現理生用由町画界発百的皮直真眠知石研破確礼秀私科秒移税種究突立端系級終結絶続綠編練罪翻翼者耐肉肩背能脅膚自臭與舌舖舞舵色花草落葉葬蘇蛇行術製襲西要見視解触言計設訳語読調謁議財買賢赤起足踏軽込近返迷追逃途進運過道達遠選鐘長閉開間関闇降除階障集離青非面音響願類飛食駆魂魔鳴！＃＄％＆（）＊／１２３４５：；＝？ＢＣＥＦＧＫＬＭＮＯＲＳＶＸＺ`ｄｆｇｍｑｒｔｗｙ～ｭｮﾂｰｱｨｶｷｸｹｺｼｽｾﾀﾁﾂﾃﾄﾅﾆﾈﾉﾊﾌﾍﾏﾐﾑﾒﾓﾔﾕﾖﾗﾙﾚﾛﾜﾝﾞﾟ微整",1,2)
		return
	}

	var ext = !f_exists($"{l}.ttf") ? ".otf" : ".ttf"
	if f_exists($"{l}{ext}") {
		l += ext
		fn[1] += ext
	}

	font_add_enable_aa(0)
	global.fnt[f] = font_add(l,siz,0,0,32,65536)
	reload_memory()
}

function l_check(ch = "日本") {return (tr("lang") = ch)}

function l_name(n = global.pname) {
	var _n = 0

	for (var i = 0;i < strlen(n);i++) {
		if !(strord(n,i) < 256 or (strord(n,i) >= 65377 and strord(n,i) <= 65439)) or l_check() {_n = 1}
	}

	return _n
}