;--------------------------------------------------------------------------------
; SelectNextFileAfterDelete.ahk
;--------------------------------------------------------------------------------
; ~Del               ; Selects the next file after deleting a file              ;
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


;--------------------------------------------------------------------------------


#If Explorer_IsActive()


~Del::
SelectNextFileAfterDelete:
if !Explorer_IsEnteringText() {
	KeyWait Del
	Send {Space}
}
Return


#If


;--------------------------------------------------------------------------------
