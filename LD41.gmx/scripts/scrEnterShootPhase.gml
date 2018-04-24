objGameController.state = GAME_STATE.SHOOT

if objGameController.roundNumber > 0 {
    audio_play_sound(sndDefendPhaseStart, 0, false)
}

// Fade out and pause build phase music
audio_sound_gain(global.buildMusic, 0, 500)
objGameController.alarm[0] = 60

// Unpause and fade in shoot phase music
objGameController.alarm[3] = 110

instance_create(objCityBuilder.cellWidth/2, objCityBuilder.cellHeight/2, objShootPlayer)

var unspentMoney
with objCityBuilder {
    enabled = false
    unspentMoney = money
    money = 0
}

with objShootController {
    enabled = true
    t = 0
    cheeseT = irandom_range(1, cheeseSpawnT)
    // Scale survive time
    //surviveT = 60 * (10 + instance_number(objCityCellBuilding)*2)
    surviveT = 60 * (15 + (objGameController.roundNumber-1)*5)
    
    if objGameController.roundNumber == 0 {
        surviveT = 60 * 10
        // Skip intro button
        objGameController.alarm[5] = 120
    }
    
    // Debuilder spawn time
    debuilderT = irandom_range(1, debuilderSpawnT)
}

// Citizens run to the nearest house
with objCitizen {
    state = 1
    
    var nearestHouse = instance_nearest(x, y, objCityCellHouse)
    
    if nearestHouse == noone {
        instance_destroy()
    } else {
        var dir = point_direction(x, y,
            nearestHouse.x+objCityBuilder.cellWidth/2,
            nearestHouse.y+objCityBuilder.cellHeight/2)
        var spd = 2
        
        hSpeed = lengthdir_x(spd, dir)
        vSpeed = lengthdir_y(spd, dir)
    }
}

// Prepare buildings to spawn evil citizens
with objCityCell {
    t = 0
    spawnT = irandom_range(1, maxSpawnT)
    citizenOut = false
    builtThisPhase = false
}

// Prepare bakeries to spawn bread
with objCityCellStore {
    breadT = irandom_range(60*2, objShootController.surviveT - 60*4)
}

// Prepare factories to spawn powerups
with objCityCellFactory {
    spawnT = irandom_range(60*2, objShootController.surviveT - 60*4)
}

// Buttons invisible
with objBuildButton {
    visible = false
}
with objButtonBacking {
    visible = false
}

// Spawn text to show that you lose all your money
if unspentMoney != 0 and objGameController.roundNumber > 0 {
    with instance_create(view_xview+view_wview-6, view_yview+view_hview-33, objText) {
        text = '-$'+string(unspentMoney)
        color = c_red
        vspeed = -0.25
        destroyT = 90
        halign = fa_right
        followView = true
    }
}
