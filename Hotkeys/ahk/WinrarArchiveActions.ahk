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
ArchiveWithWinrar:
selectedItemPath := Explorer_GetSelectedItemPath()
if selectedItemPath {
	SplitPath selectedItemPath, name, dir, ext, nameNoExt, drive
	exe := WinrarExe()
	Try Run "%exe%" a "%dir%\%nameNoExt%.rar" -m5 -ep1 -ibck "%selectedItemPath%"
}
Return


~^+!P::
ArchiveAndDeleteWithWinrar:
selectedItemPath := Explorer_GetSelectedItemPath()
if selectedItemPath {
	SplitPath selectedItemPath, name, dir, ext, nameNoExt, drive
	exe := WinrarExe()
	Try Run "%exe%" a "%dir%\%nameNoExt%.rar" -m5 -ep1 -df -dr -ibck "%selectedItemPath%"
}
Return


~^+I::
GZipWithWinrar:
selectedItemPath := Explorer_GetSelectedItemPath()
if selectedItemPath {
	SplitPath selectedItemPath, name, dir, ext, nameNoExt, drive
	exe := WinrarExe()
	Try Run "%exe%" a "%dir%\%nameNoExt%.%ext%.gz" -m5 -ep1 -ibck "%selectedItemPath%"
}
Return


~^+!I::
GZipAndDeleteWithWinrar:
selectedItemPath := Explorer_GetSelectedItemPath()
if selectedItemPath {
	SplitPath selectedItemPath, name, dir, ext, nameNoExt, drive
	exe := WinrarExe()
	Try Run "%exe%" a "%dir%\%nameNoExt%.%ext%.gz" -m5 -ep1 -df -dr -ibck "%selectedItemPath%"
}
Return


~^+O::
ExtractWithWinrar:
selectedItemPath := Explorer_GetSelectedItemPath()
if selectedItemPath {
	SplitPath selectedItemPath, name, dir, ext, nameNoExt, drive
	if Winrar_CheckFileIsArchive(ext) {
		exe := WinrarExe()
		Try RunWait "%exe%" x "%selectedItemPath%" -ibck "%dir%"
	}
}
Return


~^+!O::
ExtractAndDeleteWithWinrar:
selectedItemPath := Explorer_GetSelectedItemPath()
if selectedItemPath {
	SplitPath selectedItemPath, name, dir, ext, nameNoExt, drive
	if Winrar_CheckFileIsArchive(ext) {
		exe := WinrarExe()
		Try RunWait "%exe%" x "%selectedItemPath%" -df -dr -ibck "%dir%"
		if Filesystem_FileExists(selectedItemPath) {
			Filesystem_RecycleFile(selectedItemPath)
		}
	}
}
Return


#If


;--------------------------------------------------------------------------------
