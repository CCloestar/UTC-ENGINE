if y > room_height + 20 or x < -20 or x > room_width + 20 {destroy()}

s += 2

x += sin(s / 5) * sf
y += cos(s / 6) * sf
image_angle += r