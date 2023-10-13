;--------------------------------------------------------------------------------
; BulkRenameHere.ahk
;--------------------------------------------------------------------------------
; Shift+F2           ; Open Bulk Rename Utility in current directory            ;
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


BulkRenameHere_IsActive() {
	Return Explorer_IsActive()
}


BulkRenameUtilityExe() {
	Return "C:\Program Files\Bulk Rename Utility\Bulk Rename Utility.exe"
}


;--------------------------------------------------


#If BulkRenameHere_IsActive()


+F2::
BulkRenameHere:
activePath := Explorer_GetActivePath()
if activePath {
	exe := BulkRenameUtilityExe()
	Try Run "%exe%" "%activePath%"
}
Return


#If


;--------------------------------------------------
