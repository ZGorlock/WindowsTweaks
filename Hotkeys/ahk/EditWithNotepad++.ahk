;--------------------------------------------------------------------------------
; EditWithNotepad++.ahk
;--------------------------------------------------------------------------------
; F1                 ; Open selected file in Notepad++                          ;
;--------------------------------------------------------------------------------


#Include lib\_Config.ahk

#Include lib\Explorer.ahk
#Include lib\Filesystem.ahk


;--------------------------------------------------------------------------------


EditWithNotepadPlusPlus_IsActive() {
	return Explorer_IsActive() || Explorer_OnDesktop()
}


EditWithNotepadPlusPlus_NotepadPlusPlusExe() {
	return "C:\Program Files\Notepad++\notepad++.exe"
}


;--------------------------------------------------------------------------------


#If EditWithNotepadPlusPlus_IsActive()


F1::
EditWithNotepadPlusPlus:
{
	selectedItemPath := Explorer_GetSelectedItemPath()
	if (Filesystem_IsFile(selectedItemPath)) {
		
		exe := EditWithNotepadPlusPlus_NotepadPlusPlusExe()
		try {
			Run "%exe%" "%selectedItemPath%"
		}
	}
	return
}


#If


;--------------------------------------------------------------------------------
