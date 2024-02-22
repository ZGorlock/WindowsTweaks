;--------------------------------------------------------------------------------
; EditWithNotepad.ahk
;--------------------------------------------------------------------------------
; F1                 ; Open selected file in Notepad++                          ;
;--------------------------------------------------------------------------------


#Include lib\_Config.ahk

#Include lib\Explorer.ahk
#Include lib\Filesystem.ahk


;--------------------------------------------------------------------------------


EditWithNotepad_IsActive() {
	return Explorer_IsActive() || Explorer_OnDesktop()
}


EditWithNotepad_NotepadPlusPlusExe() {
	return "C:\Program Files\Notepad++\notepad++.exe"
}


;--------------------------------------------------------------------------------


#If EditWithNotepad_IsActive()


F1::
EditWithNotepad:
{
	selectedItemPath := Explorer_GetSelectedItemPath()
	if (Filesystem_IsFile(selectedItemPath)) {
		
		exe := EditWithNotepad_NotepadPlusPlusExe()
		try {
			Run "%exe%" "%selectedItemPath%"
		}
	}
	return
}


#If


;--------------------------------------------------------------------------------
