function m_rec(x1,y1,x2,y2,mx = device_mouse_x_to_gui(0),my = device_mouse_y_to_gui(0)) {return point_in_rectangle(mx,my,x1,y1,x2,y2)}
function m_circ(_y,_x,rad,mx = device_mouse_x_to_gui(0),my = device_mouse_y_to_gui(0)) {return point_in_circle(mx,my,_x,_y,rad)}
function m_tri(x1,y1,x2,y2,x3,y3,rad,mx = device_mouse_x_to_gui(0),my = device_mouse_y_to_gui(0)) {return point_in_triangle(mx,my,x1,y1,x2,y2,x3,y3)}

#macro m_hold mouse_check_button
#macro m_pressed mouse_check_button_pressed
#macro m_released mouse_check_button_released