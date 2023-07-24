;--------------------------------------------------------------------------------
; EditWithNotepad++.ahk
;--------------------------------------------------------------------------------
;
; F1				->	Open selected file in Notepad++
;
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


NotepadPlusPlusExe() {
	Return "C:\Program Files\Notepad++\notepad++.exe"
}


;--------------------------------------------------------------------------------


F1::
EditWithNotepad++:
selectedItemPath := Explorer_GetSelectedItemPath()
if Explorer_IsFile( selectedItemPath ) {
	exe := NotepadPlusPlusExe()
	Run "%exe%" "%selectedItemPath%"
}
Return


;--------------------------------------------------------------------------------
