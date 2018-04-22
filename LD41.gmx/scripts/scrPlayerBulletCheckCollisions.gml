var enemy = instance_place(x, y, objEnemy)
if enemy != noone {

    instance_destroy()
    
    with instance_create(x+random_range(-2, 2), y+random_range(-2, 2), objParticle) {
        image_speed = 1/3
    }
    
    with enemy {
        hp -= 1
        if hp <= 0 {
            instance_destroy()
        }
        
        // Knockback
        var h = lengthdir_x(knockback, other.direction)
        var v = lengthdir_y(knockback, other.direction)
        scrMoveContactWallsAndCityBorder(h, v)
    }
}
