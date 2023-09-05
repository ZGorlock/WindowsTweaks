;--------------------------------------------------------------------------------
; CommandPromptHere.ahk
;--------------------------------------------------------------------------------
; ~Ctrl+Shift+C      ; Open command prompt in current directory                 ;
; ~Ctrl+Shift+Alt+C  ; Open command prompt in current directory as Admin        ;
;--------------------------------------------------------------------------------


#Requires AutoHotkey v1.1

#Persistent
#SingleInstance Force
#NoTrayIcon
#NoEnv

SetKeyDelay, 0, 50
SetBatchLines 10ms
SetTitleMatchMode RegEx


;--------------------------------------------------------------------------------


#Include lib\Explorer.ahk


CmdExe() {
	Return "C:\Windows\System32\cmd.exe"
}


#If Explorer_IsActive()


;--------------------------------------------------------------------------------


~^+C::
CommandPromptHere:
activePath := Explorer_GetActivePath()
if activePath {
	exe := CmdExe()
	Run "%exe%" /k cd /d "%activePath%"
}
Return


~^+!C::
AdminCommandPromptHere:
activePath := Explorer_GetActivePath()
if activePath {
	exe := CmdExe()
	Run *RunAs "%exe%" /k cd /d "%activePath%"
}
Return


;--------------------------------------------------------------------------------
