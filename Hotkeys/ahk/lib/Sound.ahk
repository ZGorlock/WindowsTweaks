;--------------------------------------------------------------------------------
; Sound.ahk
;--------------------------------------------------------------------------------


Sound_GetWMP() {
	static WMP
	if (!isobject(WMP)) {
		WMP := ComObjCreate("WMPlayer.OCX.7")
	}
	Return WMP
}


Sound_PlayMedia(mediaFilePath, volume := 100) {
	WMP := Sound_GetWMP()
	WMP.Settings.Volume := volume
	WMP.url := mediaFilePath
	Return WMP
}


Sound_PlayMediaAndWait(mediaFilePath, volume := 100) {
	WMP := Sound_PlayMedia(mediaFilePath, volume)
	while WMP.PlayState != 1
		Sleep, 10
	Return WMP
}


Sound_Beep() {
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


;--------------------------------------------------------------------------------
