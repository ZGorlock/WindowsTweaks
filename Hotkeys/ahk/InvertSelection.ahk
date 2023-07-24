;--------------------------------------------------------------------------------
; InvertSelection.ahk
;--------------------------------------------------------------------------------
;
; Ctrl+I			->	Invert the current selection in Explorer
;
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


^I::
InvertSelection:
if Explorer_IsActive() {
	KeyWait Ctrl
	Send !HSI
}
Return


;--------------------------------------------------------------------------------
