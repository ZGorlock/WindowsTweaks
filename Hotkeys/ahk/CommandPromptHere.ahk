;--------------------------------------------------------------------------------
; CommandPromptHere.ahk
;--------------------------------------------------------------------------------
; Ctrl+Shift+C       ; Open command prompt in current directory                 ;
; Ctrl+Shift+Alt+C   ; Open command prompt in current directory as Admin        ;
;--------------------------------------------------------------------------------



#Include lib\_Config.ahk

#Include lib\Explorer.ahk


;--------------------------------------------------------------------------------


CommandPromptHere_IsActive() {
	return Explorer_IsActive() || Explorer_OnDesktop()
}


CommandPromptHere_CmdExe() {
	return "C:\Windows\System32\cmd.exe"
}


;--------------------------------------------------------------------------------


#If CommandPromptHere_IsActive()


~^+C::
~^+!C::
CommandPromptHere:
{
	alt := GetKeyState("Alt")
	
	activePath := Explorer_GetActivePath()
	if (activePath) {
		
		exe := CommandPromptHere_CmdExe()
		if (alt) {
			try {
				Run *RunAs "%exe%" /k cd /d "%activePath%"
			}
		} else {
			try {
				Run "%exe%" /k cd /d "%activePath%"
			}
		}
	}
	return
}


#If


;--------------------------------------------------------------------------------
