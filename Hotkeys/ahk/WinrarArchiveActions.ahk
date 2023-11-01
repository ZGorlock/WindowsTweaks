;--------------------------------------------------------------------------------
; WinrarArchiveActions.ahk
;--------------------------------------------------------------------------------
; Ctrl+Shift+P       ; Add selected file to WinRAR rar archive                  ;
; Ctrl+Shift+Alt+P   ; Add selected file to WinRAR rar archive and delete       ;
;                    ;                                                          ;
; Ctrl+Shift+I       ; Add selected file to WinRAR gzip archive                 ;
; Ctrl+Shift+Alt+I   ; Add selected file to WinRAR gzip archive and delete      ;
;                    ;                                                          ;
; Ctrl+Shift+O       ; Extract selected WinRAR archive                          ;
; Ctrl+Shift+Alt+O   ; Extract selected WinRAR archive and delete               ;
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
selectedItemPathList := Explorer_GetSelectedItemPathList()
if selectedItemPathList {
	
	fileList := ""
	for i, selectedItemPath in selectedItemPathList {
		fileList .= (String_IsEmpty(inclusions) ? "" : " ") . """" . selectedItemPath . """"
	}
	
	SplitPath % Array_GetFirst(selectedItemPathList), name, dir, ext, nameNoExt, drive
	baseName := (Array_Length(selectedItemPathList) = 1) ? nameNoExt : dir
	baseName := String_RegexRemove(baseName, "^(.+\\)+")
	archive := Filesystem_GetUnusedFilename(dir, baseName, "rar")
	
	exe := WinrarExe()
	if alt {
		Try RunWait "%exe%" a "%archive%" -m5 -ep1 -df -dr -ibck %fileList%
	} else {
		Try RunWait "%exe%" a "%archive%" -m5 -ep1 -ibck %fileList%
	}
}
Return


~^+I::
~^+!I::
GZipWithWinrar:
alt := GetKeyState("Alt")
selectedItemPathList := Explorer_GetSelectedItemPathList()
if selectedItemPathList {
	
	for i, selectedItemPath in selectedItemPathList {
		SplitPath selectedItemPath, name, dir, ext, nameNoExt, drive
		archive := Filesystem_GetUnusedFilename(dir, name, "gz")
		
		exe := WinrarExe()
		if alt {
			Try RunWait "%exe%" a "%archive%" -m5 -ep1 -df -dr -ibck "%selectedItemPath%"
		} else {
			Try RunWait "%exe%" a "%archive%" -m5 -ep1 -ibck "%selectedItemPath%"
		}
	}
}
Return


~^+O::
~^+!O::
ExtractWithWinrar:
alt := GetKeyState("Alt")
selectedItemPathList := Explorer_GetSelectedItemPathList()
if selectedItemPathList {
	
	for i, selectedItemPath in selectedItemPathList {
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
}
Return


#If


;--------------------------------------------------------------------------------
