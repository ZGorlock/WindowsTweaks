;--------------------------------------------------------------------------------
; Sound.ahk
;--------------------------------------------------------------------------------


Sound_Player_GetInstance(reload := FALSE) {
	static WMP
	if (reload && IsObject(WMP)) {
		WMP := ""
	}
	if (!IsObject(WMP)) {
		try {
			WMP := ComObjCreate("WMPlayer.OCX.7")
			WMP.Settings.AutoStart := FALSE
			WMP.Settings.Rate := 1.0
			WMP.Settings.Volume := 100
		}
	}
	return WMP
}


Sound_Player_Load(mediaFilePath) {
	player := Sound_Player_GetInstance()
	player.Url := mediaFilePath
}


Sound_Player_GetControls() {
	player := Sound_Player_GetInstance()
	return player.Controls
}


Sound_Player_Start() {
	controls := Sound_Player_GetControls()
	controls.Play
}


Sound_Player_Pause() {
	controls := Sound_Player_GetControls()
	controls.Pause
}


Sound_Player_Stop() {
	controls := Sound_Player_GetControls()
	controls.Stop
}


Sound_Player_GetSettings() {
	player := Sound_Player_GetInstance()
	return player.Settings
}


Sound_Player_SetVolume(volume) {
	settings := Sound_Player_GetSettings()
	settings.Volume := volume
}


Sound_Player_GetState() {
	player := Sound_Player_GetInstance()
	return player.PlayState
}


Sound_Player_InUse() {
	return (Sound_Player_GetState() != (WMPPlayState_wmppsStopped := 1))
}


Sound_PlayMedia(mediaFilePath, volume := 100) {
	if (Sound_Player_InUse()) {
		Sound_Player_Stop()
	}
	Sound_Player_Load(mediaFilePath)
	Sound_Player_SetVolume(volume)
	Sound_Player_Start()
}


Sound_PlayMediaAndWait(mediaFilePath, volume := 100) {
	Sound_PlayMedia(mediaFilePath, volume)
	loop {
		Sleep 10
	} until (!Sound_Player_InUse())
}


Sound_Play(mediaFilePath, wait := FALSE) {
	SoundPlay, % mediaFilePath, % wait
}


Sound_PlayAndWait(mediaFilePath) {
	Sound_Play(mediaFilePath, TRUE)
}


Sound_Stop(mediaFilePath) {
	Sound_Play("null.wav")
}


Sound_Notify() {
	SoundPlay *-1
}


Sound_Error() {
	SoundPlay *16
}


Sound_Question() {
	SoundPlay *32
}


Sound_Exclamation() {
	SoundPlay *48
}


Sound_Info() {
	SoundPlay *64
}


Sound_Beep(frequency := 523, duration := 150) {
	SoundBeep, frequency, duration
}


;--------------------------------------------------------------------------------
