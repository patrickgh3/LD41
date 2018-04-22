///scrCreatePoof(x, y)
with instance_create(
hoverX+cellWidth/2+argument0,
hoverY+cellHeight/2+argument1,
objParticle) {
    sprite_index = choose(sprPoof2, sprPoof3, sprPoof4, sprPoof5)
    image_speed = 1/5
    image_xscale = choose(1, -1)
    image_yscale = choose(1, -1)
}
