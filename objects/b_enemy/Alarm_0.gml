if !sha {sha = x}
x = sha + shaker

if shaker < 0 {shaker = -(shaker + 1)}
if shaker > 0 {shaker = -shaker}
if shaker = 0 {
	sha = 0
	shaking = 0
	_hurt = 0
	destroy(b_dmg)
}
else {alarm[0] = 2}