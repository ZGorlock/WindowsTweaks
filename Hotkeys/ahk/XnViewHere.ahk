;--------------------------------------------------------------------------------
; XnViewHere.ahk
;--------------------------------------------------------------------------------
; Shift+F1           ; Open XnView MP in current directory                      ;
;--------------------------------------------------------------------------------


#Include lib\_Config.ahk

#Include lib\Explorer.ahk


;--------------------------------------------------------------------------------


XnViewHere_IsActive() {
	return Explorer_IsActive()
}


XnViewHere_XnViewMpExe() {
	return "C:\Program Files\XnViewMP\xnviewmp.exe"
}


;--------------------------------------------------


#If XnViewHere_IsActive()


+F1::
XnViewHere:
{
	activePath := Explorer_GetActivePath()
	if (activePath) {
		
		exe := XnViewHere_XnViewMpExe()
		try {
			Run "%exe%" "%activePath%"
		}
	}
	return
}


#If


;--------------------------------------------------
