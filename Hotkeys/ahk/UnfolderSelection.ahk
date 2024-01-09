;--------------------------------------------------------------------------------
; UnfolderSelection.ahk
;--------------------------------------------------------------------------------
; Ctrl+Shift+/       ; Empty selected sub-folder(s) into the current directory  ;
; Ctrl+Shift+Alt+/   ; Empty all sub-folders into the current directory         ;
;--------------------------------------------------------------------------------


#Include lib\_Config.ahk

#Include lib\Array.ahk
#Include lib\Explorer.ahk
#Include lib\Filesystem.ahk
#Include lib\String.ahk


;--------------------------------------------------------------------------------


UnfolderSelection_IsActive() {
	return Explorer_IsActive()
}


UnfolderSelection_EmptySubFolder(activeDir, subDir) {
	subFiles := Filesystem_ListFiles(subDir)
	for subIndex, subPath in subFiles {
		destPath := String_Replace(subPath, subDir, activeDir)
		if (!Filesystem_FileExists(destPath)) {
			Filesystem_MoveFile(subPath, destPath)
		}
	}
	if (Filesystem_DirIsEmpty(subDir)) {
		Filesystem_DeleteDir(subDir)
	}
}


UnfolderSelection_ConfirmationPrompt(activeDir, selectedFolders) {
	prompt := "Hotkey is about empty the following directories to the current directory:" . "`n" . "`n" . Array_ArrToStr(selectedFolders) . "`n" . "`n" . "Do you wish to continue?" 
	MsgBox, 260, , % prompt
	IfMsgBox, Yes
		return TRUE
	Else
		return FALSE
}


;--------------------------------------------------------------------------------


#If UnfolderSelection_IsActive()


~^+/::
~^+!/::
UnfolderSelection:
{
	alt := GetKeyState("Alt")
	
	activeDir := Explorer_GetActivePath()
	selectedFolders := alt ? Filesystem_ListDirs(activeDir) : Explorer_GetSelectedItemPathList("D")
	if (activeDir && selectedFolders && Array_IsNotEmpty(selectedFolders)) {
		
		if (UnfolderSelection_ConfirmationPrompt(activeDir, selectedFolders)) {
			
			for index, path in selectedFolders {
				UnfolderSelection_EmptySubFolder(activeDir, path)
			}
		}
	}
	return
}


#If


;--------------------------------------------------------------------------------
