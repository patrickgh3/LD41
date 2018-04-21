var cw = objCityBuilder.cellWidth
var ch = objCityBuilder.cellHeight
var r = objCityCellRoad

var left = instance_place(x-cw, y, r)
var right = instance_place(x+cw, y, r)
var up = instance_place(x, y-ch, r)
var down = instance_place(x, y+ch, r)

if left and right and !up and !down {
    image_index = 0
} else if !left and !right and up and down {
    image_index = 1
} else if left and right and up and down {
    image_index = 2
} else if left and !right and !up and down {
    image_index = 4
} else if left and !right and up and !down {
    image_index = 5
} else if !left and right and up and !down {
    image_index = 6
} else if !left and right and !up and down {
    image_index = 7
} else if left and right and up and !down {
    image_index = 8
} else if left and right and !up and down {
    image_index = 9
} else if left and !right and up and down {
    image_index = 10
} else if !left and right and up and down {
    image_index = 11
} else if !left and !right and !up and down {
    image_index = 12
} else if left and !right and !up and !down {
    image_index = 13
} else if !left and !right and up and !down {
    image_index = 14
} else if !left and right and !up and !down {
    image_index = 15
} else {
    image_index = 3
}
