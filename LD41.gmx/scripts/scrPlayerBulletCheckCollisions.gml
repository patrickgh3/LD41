// Check for collision with any enemy
var enemy = instance_place(x, y, objEnemy)
if enemy == noone {
    return 0
}

/*with instance_create(x+random_range(-2, 2), y+random_range(-2, 2), objParticle) {
    image_speed = 1/3
}*/

with enemy {
    // Invulnerable if inside fog
    if !place_meeting(x, y, objFogBlocker) {
        return 0
    }
    
    hp -= other.shotPower
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
        instance_destroy() // Particles on death are in enemy Destroy events
        
        if object_index == objCheeseEnemy {
            audio_stop_sound(sndCheeseDeath)
            audio_play_sound(sndCheeseDeath, 0, false)
        } else if object_index == objCitizenEnemy {
            audio_stop_sound(sndCitizenDeath)
            audio_play_sound(sndCitizenDeath, 0, false)
        } else if object_index == objDebuilderEnemy {
            audio_stop_sound(sndDebuilderDeath)
            audio_play_sound(sndDebuilderDeath, 0, false)
        }
    }
}

instance_destroy()
