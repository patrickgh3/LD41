var dx = display_mouse_get_x()
var dy = display_mouse_get_y()
var wx = window_get_x()
var wy = window_get_y()
return dx >= wx and dx < wx + window_get_width()
    and dy >= wy and dy < wy + window_get_height()
