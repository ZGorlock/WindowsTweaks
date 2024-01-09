;--------------------------------------------------------------------------------
; DisableCloseExplorerHotkey.ahk
;--------------------------------------------------------------------------------
; Ctrl+W             ; Disables the 'Close Window' shortcut in Explorer         ;
;--------------------------------------------------------------------------------


#Include lib\_Config.ahk

#Include lib\Explorer.ahk


;--------------------------------------------------------------------------------


DisableCloseExplorerHotkey_IsActive() {
	return Explorer_IsActive()
}


;--------------------------------------------------------------------------------


#If DisableCloseExplorerHotkey_IsActive()


^W::
DisableCloseExplorerHotkey:
{
	return
}


#If


;--------------------------------------------------------------------------------
