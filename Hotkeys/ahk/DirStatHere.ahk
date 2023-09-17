;--------------------------------------------------------------------------------
; DirStatHere.ahk
;--------------------------------------------------------------------------------
; Shift+F3           ; Open WinDirStat in current directory                     ;
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


DirStatHere_IsActive() {
	Return Explorer_IsActive()
}


WinDirStatExe() {
	Return "C:\Program Files (x86)\WinDirStat\windirstat.exe"
}


;--------------------------------------------------------------------------------


#If DirStatHere_IsActive()


+F3::
DirStatHere:
activePath := Explorer_GetActivePath()
if activePath {
	exe := WinDirStatExe()
	Try Run "%exe%" "%activePath%"
}
Return


#If


;--------------------------------------------------------------------------------
