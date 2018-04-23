objGameController.state = GAME_STATE.BUILD

// Delay playing jingle
objGameController.alarm[4] = 30

// Fade out and pause shoot phase music
audio_sound_gain(global.shootMusic, 0, 500)
objGameController.alarm[2] = 60

// Unpause and fade in build phase music
objGameController.alarm[1] = 100

with objShootController {
    enabled = false
    lastPlayerHealth = objShootPlayer.hp
}

with objCityBuilder {
    alarm[1] = 120 // Enable self after delay
    
    structure = STRUCTURE.ROAD
    with objBuildButton {
        if structure == other.structure {
            other.buttonSelected = id
        }
    }
    
    money += moneyPerRound
    marioExists = false
    luigiExists = false
    //alarm[0] = 50 // Ka-ching for factories earning money
    t = 0
    
    // Calculate score
    numBuildings = instance_number(objCityCellBuilding)
}

// Destroy objects
with objShootPlayer {
    instance_destroy()
}
with objPlayerBullet {
    instance_destroy()
}
with objEnemy {
    instance_destroy()
}
with objEnemyBullet {
    instance_destroy()
}
with objBread {
    instance_destroy()
}
with objRageGun {
    instance_destroy()
}
// Start citizen spawn timers
with objCityCell {
    t = 0
    citizenSpawnT = irandom_range(1, 100)
}

// Create text to show that you gain some money for free
/*with instance_create(view_xview+view_wview-6, view_yview+view_hview-33, objText) {
    text = '+$'+string(objCityBuilder.moneyPerRound)
    color = c_lime
    vspeed = -0.5
    destroyT = 60
    halign = fa_right
    followView = true
}*/
