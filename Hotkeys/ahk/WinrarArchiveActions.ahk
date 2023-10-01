;--------------------------------------------------------------------------------
; WinrarArchiveActions.ahk
;--------------------------------------------------------------------------------
; Ctrl+Shift+P       ; Add selected file to winrar rar archive                  ;
; Ctrl+Shift+Alt+P   ; Add selected file to winrar rar archive and delete       ;
;                    ;                                                          ;
; Ctrl+Shift+I       ; Add selected file to winrar gzip archive                 ;
; Ctrl+Shift+Alt+I   ; Add selected file to winrar gzip archive and delete      ;
;                    ;                                                          ;
; Ctrl+Shift+O       ; Extract selected winrar archive                          ;
; Ctrl+Shift+Alt+O   ; Extract selected winrar archive and delete               ;
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
#Include lib\String.ahk


WinrarArchiveActions_IsActive() {
	Return Explorer_IsActive()
}


WinrarExe() {
	Return "C:\Program Files\WinRAR\WinRAR.exe"
}


Winrar_CheckFileIsArchive(ext) {
	Return String_RegexMatches(ext, "rar|zip|cab|arj|lzh|tar|gz|zst|ace|uue|bz2|jar|iso|7z|z|zipx")
}


;--------------------------------------------------------------------------------


#If WinrarArchiveActions_IsActive()


~^+P::
~^+!P::
ArchiveWithWinrar:
alt := GetKeyState("Alt")
selectedItemPath := Explorer_GetSelectedItemPath()
if selectedItemPath {
	SplitPath selectedItemPath, name, dir, ext, nameNoExt, drive
	archive := dir . "\" . nameNoExt . ".rar"
	exe := WinrarExe()
	if alt {
		Try Run "%exe%" a "%archive%" -m5 -ep1 -df -dr -ibck "%selectedItemPath%"
	} else {
		Try Run "%exe%" a "%archive%" -m5 -ep1 -ibck "%selectedItemPath%"
	}
}
Return


~^+I::
~^+!I::
GZipWithWinrar:
alt := GetKeyState("Alt")
selectedItemPath := Explorer_GetSelectedItemPath()
if selectedItemPath {
	SplitPath selectedItemPath, name, dir, ext, nameNoExt, drive
	archive := dir . "\" . name . ".gz"
	exe := WinrarExe()
	if alt {
		Try Run "%exe%" a "%archive%" -m5 -ep1 -df -dr -ibck "%selectedItemPath%"
	} else {
		Try Run "%exe%" a "%archive%" -m5 -ep1 -ibck "%selectedItemPath%"
	}
}
Return


~^+O::
~^+!O::
ExtractWithWinrar:
alt := GetKeyState("Alt")
selectedItemPath := Explorer_GetSelectedItemPath()
if selectedItemPath {
	SplitPath selectedItemPath, name, dir, ext, nameNoExt, drive
	if Winrar_CheckFileIsArchive(ext) {
		exe := WinrarExe()
		if alt {
			Try RunWait "%exe%" x "%selectedItemPath%" -df -dr -ibck "%dir%"
			if Filesystem_FileExists(selectedItemPath) {
				Filesystem_RecycleFile(selectedItemPath)
			}
		} else {
			Try RunWait "%exe%" x "%selectedItemPath%" -ibck "%dir%"
		}
	}
}
Return


#If


;--------------------------------------------------------------------------------
