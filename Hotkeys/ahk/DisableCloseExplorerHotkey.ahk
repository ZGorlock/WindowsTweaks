;--------------------------------------------------------------------------------
; DisableCloseExplorerHotkey.ahk
;--------------------------------------------------------------------------------
; Ctrl+W             ; Disables the 'Close Window' shortcut in Explorer         ;
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


DisableCloseExplorerHotkey_IsActive() {
	Return Explorer_IsActive()
}


;--------------------------------------------------------------------------------


#If DisableCloseExplorerHotkey_IsActive()


$^W::
DisableCloseExplorerHotkey:
if !Explorer_IsActive() {
	Send ^w
}
Return


#If


;--------------------------------------------------------------------------------
