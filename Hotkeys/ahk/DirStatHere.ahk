;--------------------------------------------------------------------------------
; DirStatHere.ahk
;--------------------------------------------------------------------------------
; Shift+F3           ; Open WinDirStat in current directory                     ;
;--------------------------------------------------------------------------------


#Include lib\_Config.ahk

#Include lib\Explorer.ahk


;--------------------------------------------------------------------------------


DirStatHere_IsActive() {
	return Explorer_IsActive()
}


DirStatHere_WinDirStatExe() {
	return "C:\Program Files (x86)\WinDirStat\windirstat.exe"
}


;--------------------------------------------------------------------------------


#If DirStatHere_IsActive()


+F3::
DirStatHere:
{
	activePath := Explorer_GetActivePath()
	if (activePath) {
		
		exe := DirStatHere_WinDirStatExe()
		try {
			Run "%exe%" "%activePath%"
		}
	}
	return
}


#If


;--------------------------------------------------------------------------------
