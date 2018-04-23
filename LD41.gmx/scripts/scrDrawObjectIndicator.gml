///scrDrawObjectIndicator(viewRectOffset, indicatorSprite)
// Draws an indicator arrow if the object is not within view.

var offset = argument0
var spr = argument1

if not collision_rectangle(
view_xview+offset,
view_yview+offset,
view_xview+view_wview-offset,
view_yview+view_hview-offset,
id, false, false) {
    var xc = view_xview+view_wview/2
    var yc = view_yview+view_hview/2
    var dir = point_direction(xc, yc, x, y)
    var len = 100
    var len2 = 80
    
    draw_sprite_ext(spr, 0,
        xc + lengthdir_x(len, dir),
        yc + lengthdir_y(len, dir),
        1, 1, dir, c_white, 1)
        
    draw_sprite_ext(spr, 1,
        xc + lengthdir_x(len2, dir),
        yc + lengthdir_y(len2, dir),
        1, 1, 0, c_white, 1)
}
