///scrSpawnPowerup(powerupObj)

if not instance_exists(objShootPlayer) {
    exit
}

var n = instance_number(objCityCellRoad)
    
// Try a bunch of times to find a valid random bread spawn location
for (var i=0; i<30; i++) {
    var road = instance_find(objCityCellRoad, irandom(n-1))
    
    with road {
        var xc = x+16
        var yc = y+16
        var hasPowerup = place_meeting(x, y, objBread) or place_meeting(x, y, objRageGun)
    }
    var farFromPlayer = point_distance(xc, yc, objShootPlayer.x, objShootPlayer.y) > 32
    //var nearBread = instance_nearest(xc, yc, objBread)
    //var farFromBread = nearBread == noone or point_distance(xc, yc, nearBread.x, nearBread.y) > 16
    
    if not hasPowerup and farFromPlayer {
        var powerup = instance_create(xc, yc, argument0)
        with scrCreatePoof(xc, yc) {
            depth = powerup.depth-1
            sprite_index = choose(sprPoof4, sprPoof5)
        }
        break
    }
}
