objGameController.state = GAME_STATE.SHOOT

audio_play_sound(sndDefendPhase, 0, false)

// Fade out and pause build phase music
audio_sound_gain(global.buildMusic, 0, 500)
objGameController.alarm[0] = 60

var unspentMoney
with objCityBuilder {
    enabled = false
    instance_create(cellWidth/2, cellHeight/2, objShootPlayer)
    unspentMoney = money
    money = 0
}

with objShootController {
    enabled = true
    t = 0
    cheeseT = irandom_range(1, cheeseSpawnT)
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
    breadT = irandom_range(180, objShootController.surviveT - 180)
}

// Buttons invisible
with objBuildButton {
    visible = false
}
with objButtonBacking {
    visible = false
}

// Spawn text to show that you lose all your money
with instance_create(view_xview+view_wview-6, view_yview+view_hview-33, objText) {
    text = '-$'+string(unspentMoney)
    color = c_red
    vspeed = -0.5
    destroyT = 60
    halign = fa_right
    followView = true
}
