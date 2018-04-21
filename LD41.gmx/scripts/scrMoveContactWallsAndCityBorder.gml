///scrMoveContactWallsAndCityBorder(dx, dy)

var h = argument0
var v = argument1

// If we're already stuck in a wall or outside of the city, just
// disregard collisions and move as we please, to try to get us un-stuck.
if place_meeting(x, y, objWall) or not place_meeting(x, y, objCityCell) {
    x += h
    y += v
    exit
}

var xprev = x;
var yprev = y;

x += h
y += v

// Wall and city border collisions -
// If we just walked into a wall, move back, and then rub up against walls
// in the x direction and the y direction. Same with moving outside the city.

if place_meeting(x, y, objWall) or not place_meeting(x, y, objCityCell) {
    x = xprev
    y = yprev
    
    for (var i=0; i<abs(h); i++) {
        x += sign(h)
        if place_meeting(x, y, objWall) or not place_meeting(x, y, objCityCell) {
            x -= sign(h)
            break
        }
    }
    
    for (var i=0; i<abs(v); i++) {
        y += sign(v)
        if place_meeting(x, y, objWall) or not place_meeting(x, y, objCityCell) {
            y -= sign(v)
            break
        }
    }
}

