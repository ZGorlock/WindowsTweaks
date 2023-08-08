;--------------------------------------------------------------------------------
; DisableCloseExplorerHotkey.ahk
;--------------------------------------------------------------------------------
; $Ctrl+W            ; Disables the 'Close Window' shortcut in Explorer         ;
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


$^W::
DisableCloseExplorerHotkey:
if Explorer_IsActive() {
	Return
}
Send ^w
Return


;--------------------------------------------------------------------------------
