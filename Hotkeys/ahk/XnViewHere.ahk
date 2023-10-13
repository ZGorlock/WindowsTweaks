;--------------------------------------------------------------------------------
; XnViewHere.ahk
;--------------------------------------------------------------------------------
; Shift+F1           ; Open XnView in current directory                         ;
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


XnViewHere_IsActive() {
	Return Explorer_IsActive()
}


XnViewExe() {
	Return "C:\Program Files\XnViewMP\xnviewmp.exe"
}


;--------------------------------------------------


#If XnViewHere_IsActive()


+F1::
XnViewHere:
activePath := Explorer_GetActivePath()
if activePath {
	exe := XnViewExe()
	Try Run "%exe%" "%activePath%"
}
Return


#If


;--------------------------------------------------
