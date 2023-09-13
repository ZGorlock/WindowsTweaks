;--------------------------------------------------------------------------------
; UnfolderSelection.ahk
;--------------------------------------------------------------------------------
; Ctrl+Shift+/       ; Empty selected sub-folder(s) into the current directory  ;
; Ctrl+Shift+Alt+/   ; Empty all sub-folders into the current directory         ;
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


#Include lib\Array.ahk
#Include lib\Explorer.ahk
#Include lib\Filesystem.ahk
#Include lib\String.ahk


UnfolderSelection_IsActive() {
	Return Explorer_IsActive()
}


EmptySubFolder(activeDir, subDir) {
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


UnfolderSelectionConfirmationPrompt(activeDir, selectedFolders) {
	prompt := "Hotkey is about empty the following directories to the current directory:" . "`n" . "`n" . Array_ArrToStr(selectedFolders) . "`n" . "`n" . "Do you wish to continue?" 
	MsgBox, 260, , % prompt
	IfMsgBox, Yes
		Return TRUE
	Else
		Return FALSE
}


;--------------------------------------------------------------------------------


#If UnfolderSelection_IsActive()


~^+/::
EmptySelectedSubFolders:
activeDir := Explorer_GetActivePath()
selectedFolders := Explorer_GetSelectedItemPathList("D")
if activeDir && selectedFolders && Array_IsNotEmpty(selectedFolders) {
	if UnfolderSelectionConfirmationPrompt(activeDir, selectedFolders) {
		for index, path in selectedFolders {
			EmptySubFolder(activeDir, path)
		}
	}
}
Return


~^+!/::
EmptyAllSubFolders:
activeDir := Explorer_GetActivePath()
selectedFolders := Filesystem_ListDirs(activeDir)
if activeDir && selectedFolders && Array_IsNotEmpty(selectedFolders) {
	if UnfolderSelectionConfirmationPrompt(activeDir, selectedFolders) {
		for index, path in selectedFolders {
			EmptySubFolder(activeDir, path)
		}
	}
}
Return


#If


;--------------------------------------------------------------------------------
