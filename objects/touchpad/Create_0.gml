global.init = -1

debug = 0

for (var i = 0;i < 9;i++) {m[i] = 0}
for (var i = 0;i < 2;i++) {set[i] = 0.25 * (i + 1)}
if is_web() {set[1] = 0.4}
ch = 0
ch_t = 0
f = 0

var c = "config.ini"

if f_exists(c) {
	ini_open(c)
		debug = (load_real("device",,c) = 2)
		for (var i = 0;i < 2;i++) {set[i] = load_real($"ts{i}",set[i],c)}
	ini_close()
}

if !is_mobile() {global.init = 0}
a = 0.3