if !surface_exists(self.surf) and !dead {self.surf = surface_create(room_width,room_height)}
else if surface_exists(self.surf) {
	surface_set_target(self.surf) {draw_clear_alpha(c_black,0)}
	surface_reset_target()
}