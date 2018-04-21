var cellWidth = objCityBuilder.cellWidth
var cellHeight = objCityBuilder.cellHeight

var cellX = floor(x/cellWidth)*cellWidth
var cellY = floor(y/cellHeight)*cellHeight

// Find all adjacent roads
var roads = ds_list_create()
var r = instance_position(cellX-cellWidth, cellY, objCityCellRoad)
if instance_exists(r) {
    ds_list_add(roads, r)
}
var r = instance_position(cellX+cellWidth, cellY, objCityCellRoad)
if instance_exists(r) {
    ds_list_add(roads, r)
}
var r = instance_position(cellX, cellY-cellHeight, objCityCellRoad)
if instance_exists(r) {
    ds_list_add(roads, r)
}
var r = instance_position(cellX, cellY+cellHeight, objCityCellRoad)
if instance_exists(r) {
    ds_list_add(roads, r)
}

if ds_list_size(roads) == 0 {
    // This should never happen...
    image_xscale = 3
    exit
}

// If this isn't a dead-end road tile, remove the road tile
// we just came from as an option.
if ds_list_size(roads) != 1 {
    for (var i=0; i<ds_list_size(roads); i++) {
        if roads[|i] == roadCameFrom {
            ds_list_delete(roads, i)
            break
        }
    }
}

// Pick a random road from the remaining list.
ds_list_shuffle(roads)
roadCameFrom = targetRoad
targetRoad = roads[|0]
ds_list_destroy(roads)

// Move toward that road
var dir = point_direction(
    x, y,
    targetRoad.x+cellWidth/2,
    targetRoad.y+cellHeight/2)
dir = round(dir/90)*90
walkSpeed = random_range(0.25, 0.75)
hSpeed = lengthdir_x(walkSpeed, dir)
vSpeed = lengthdir_y(walkSpeed, dir)

// Choose the point at which we'll stop and consider changing directions.
var v = 8
if hSpeed != 0 {
    xTarget = targetRoad.x+cellWidth/2 + irandom_range(-v, v)
    yTarget = 10000
}
if vSpeed != 0 {
    yTarget = targetRoad.y+cellHeight/2 + irandom_range(-v, v)
    xTarget = 10000
}
