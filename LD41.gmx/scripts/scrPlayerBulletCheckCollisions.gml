// Check for collision with any enemy
var enemy = instance_place(x, y, objEnemy)
if enemy == noone {
    return 0
}

instance_destroy()

/*with instance_create(x+random_range(-2, 2), y+random_range(-2, 2), objParticle) {
    image_speed = 1/3
}*/

with enemy {
    // Invulnerable if inside fog
    if !place_meeting(x, y, objFogBlocker) {
        return 0
    }
    
    hp -= 1
    // Hurt the enemy
    if hp > 0 {
        // Knockback
        if not place_meeting(x, y, objWall) {
            var h = lengthdir_x(knockback, other.direction)
            var v = lengthdir_y(knockback, other.direction)
            scrMoveContactWalls(h, v)
        }
        
        // Hurt particles
        if random(1) < 0.75 {
            var partX = x+random_range(-2, 2)
            var partY = y+random_range(-2, 2)
            
            if object_index == objCheeseEnemy {
                with instance_create(partX, partY, objParticle) {
                    sprite_index = sprCheeseDisposeParticle
                    image_speed = 1/5
                }
            
            } else if object_index == objCitizenEnemy {
                with instance_create(partX, partY, objParticle) {
                    sprite_index = sprCitizenDisposeParticle
                    image_speed = 1/5
                }
            } else if object_index == objDebuilderEnemy {
                partX = x+random_range(-15, 15)
                partY = y+random_range(-15, 15)
                with instance_create(partX, partY, objParticle) {
                    sprite_index = sprCitizenDisposeParticle
                    image_speed = 1/5
                }
            }
        }
    
    // Kill the enemy
    } else {
        instance_destroy()
        audio_stop_sound(sndCitizenDeath)
        audio_play_sound(sndCitizenDeath, 0, false)
        
        // Death particles
        if object_index == objCheeseEnemy {
            scrCreatePoof(x, y)
            with instance_create(x, y-3, objParticle) {
                sprite_index = sprCheeseDropParticle
                image_speed = 1/10
            }
        
        } else if object_index == objCitizenEnemy {
            scrCreatePoof(x, y)
            with instance_create(x, y-3, objParticle) {
                sprite_index = sprDroppedGun
                image_angle = random(360)
                dAngle = choose(-1.5, 1.5)
                
                direction = 90+random_range(-12, 12)
                gravity = 0.10
                speed = 2.5
                destroyT = 60
                destroyOnAnimEnd = false
                destroyFallBelowStartPos = true
            }
        
        } else if object_index == objDebuilderEnemy {
            var d = 8
            scrCreatePoof(x, y)
            scrCreatePoof(x-d, y-d)
            scrCreatePoof(x-d, y+d)
            scrCreatePoof(x+d, y-d)
            scrCreatePoof(x+d, y+d)
            repeat 10 {
                var partX = x+random_range(-10, 10)
                var partY = y+random_range(-10, 10)
                with instance_create(x, y-3, objParticle) {
                    sprite_index = sprCitizenDisposeParticle
                    image_speed = 1/10
                }
            }
        }
    }
}
