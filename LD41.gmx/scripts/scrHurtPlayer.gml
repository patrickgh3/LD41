if iframes == 0 {
    hp -= 1
    iframes = maxIframes
    audio_play_sound(sndPlayerHurt, 0, false)
}
