;--------------------------------------------------------------------------------
; ExplorerActions.ahk
;--------------------------------------------------------------------------------
;
; F1				->	Open selected file in Notepad++
;
; Shift+F2			->	Open BulkRenameUtility in current directory
;
; Shift+F3			->	Open WinDirStat in current directory
;
; Ctrl+Shift+C		->	Open command prompt in current directory
; Ctrl+Shift+Alt+C	->	Open command prompt in current directory as Admin
;
; Ctrl+Shift+M		->	Create new .txt document in current directory
;
; Ctrl+Shift+P		->	Add selectedItemPath file to winrar rar archive
; Ctrl+Shift+Alt+P	->	Add selectedItemPath file to winrar rar archive and delete
; Ctrl+Shift+I		->	Add selectedItemPath file to winrar gzip archive
; Ctrl+Shift+Alt+I	->	Add selectedItemPath file to winrar gzip archive and delete
; Ctrl+Shift+O		->	Extract selectedItemPath winrar archive
; Ctrl+Shift+Alt+O	->	Extract selectedItemPath winrar archive and delete (NOT WORKING)
;
; Ctrl+I			->	Invert the current selection in Explorer
;
; ~Del				->	Selects the next file after deleting a file
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


#Include EditWithNotepad++.ahk
#Include BulkRenameHere.ahk
#Include DirStatHere.ahk

#Include CommandPromptHere.ahk
#Include NewTextDocument.ahk

#Include WinrarArchiveActions.ahk

#Include InvertSelection.ahk
#Include SelectNextFileAfterDelete.ahk


;--------------------------------------------------------------------------------
