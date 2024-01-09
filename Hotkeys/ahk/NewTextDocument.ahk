;--------------------------------------------------------------------------------
; NewTextDocument.ahk
;--------------------------------------------------------------------------------
; Ctrl+Shift+M       ; Create new .txt document in current directory            ;
;--------------------------------------------------------------------------------


#Include lib\_Config.ahk

#Include lib\Explorer.ahk
#Include lib\Filesystem.ahk


;--------------------------------------------------------------------------------


NewTextDocument_IsActive() {
	return Explorer_IsActive() || Explorer_OnDesktop()
}


;--------------------------------------------------------------------------------


#If NewTextDocument_IsActive()


~^+M::
NewTextDocument:
{
	activeDir := Explorer_GetActivePath()
	if (activeDir) {
		
		txtFile := Filesystem_GetUnusedFilename(activeDir, "New Text Document", "txt")
		if (txtFile) {
			
			Filesystem_CreateFile(txtFile)
			Explorer_RenameItem(txtFile)
		}
	}
	return
}


#If


;--------------------------------------------------------------------------------
