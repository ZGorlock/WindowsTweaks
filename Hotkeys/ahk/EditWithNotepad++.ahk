;--------------------------------------------------------------------------------
; EditWithNotepad++.ahk
;--------------------------------------------------------------------------------
; F1                 ; Open selected file in Notepad++                          ;
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


EditWithNotepadPlusPlus_IsActive() {
	Return Explorer_IsActive() || Explorer_OnDesktop()
}


NotepadPlusPlusExe() {
	Return "C:\Program Files\Notepad++\notepad++.exe"
}


;--------------------------------------------------------------------------------


#If EditWithNotepadPlusPlus_IsActive()


F1::
EditWithNotepad++:
selectedItemPath := Explorer_GetSelectedItemPath()
if Filesystem_IsFile(selectedItemPath) {
	exe := NotepadPlusPlusExe()
	Try Run "%exe%" "%selectedItemPath%"
}
Return


#If


;--------------------------------------------------------------------------------
