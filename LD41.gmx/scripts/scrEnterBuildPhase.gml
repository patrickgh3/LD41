objGameController.state = GAME_STATE.BUILD

audio_play_sound(sndBuildPhase, 0, false)

with objShootController {
    enabled = false
}

with objCityBuilder {
    enabled = true
    money += moneyPerRound
    
    structure = STRUCTURE.ROAD
    with objBuildButton {
        if structure == other.structure {
            other.buttonSelected = id
        }
    }
    
    marioExists = false
    luigiExists = false
    alarm[0] = 50 // Ka-ching for factories earning money
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
// Start citizen spawn timers
with objCityCell {
    t = 0
    citizenSpawnT = irandom_range(1, 200)
}

// Buttons visible
with objBuildButton {
    visible = true
}
with objButtonBacking {
    visible = true
}

// Create text to show that you gain some money for free
with instance_create(view_xview+view_wview-6, view_yview+view_hview-33, objText) {
    text = '+$'+string(objCityBuilder.moneyPerRound)
    color = c_lime
    vspeed = -0.5
    destroyT = 60
    halign = fa_right
    followView = true
}
