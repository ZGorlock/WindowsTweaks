;--------------------------------------------------------------------------------
; NewTextDocument.ahk
;--------------------------------------------------------------------------------
; Ctrl+Shift+M       ; Create new .txt document in current directory            ;
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
#Include lib\Filesystem.ahk


NewTextDocument_IsActive() {
	Return Explorer_IsActive() || Explorer_OnDesktop()
}


;--------------------------------------------------------------------------------


#If NewTextDocument_IsActive()


~^+M::
NewTextDocument:
activeDir := Explorer_GetActivePath()
if activeDir {
	txtFile := Filesystem_GetUnusedFilename(activeDir, "New Text Document", "txt")
	if txtFile {
		Filesystem_CreateFile(txtFile)
		Explorer_RenameItem(txtFile)
	}
}
Return


#If


;--------------------------------------------------------------------------------
