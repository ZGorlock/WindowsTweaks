;--------------------------------------------------------------------------------
; ResolvePopupModal.ahk
;--------------------------------------------------------------------------------
; Mouse[Back]        ; Rejects the active popup dialog                          ;
; Mouse[Forward]     ; Accepts the active popup dialog                          ;
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


#Include lib\Desktop.ahk
#Include lib\String.ahk


ResolvePopupModal_IsActive() {
	Return String_Equals(Desktop_GetActiveWindowClass(), "#32770")
}


;--------------------------------------------------------------------------------


#If ResolvePopupModal_IsActive()


XButton1::
RejectPopupModal:
Send {Escape}
Return


XButton2::
AcceptPopupModal:
Send {Enter}
Return


#If


;--------------------------------------------------------------------------------
