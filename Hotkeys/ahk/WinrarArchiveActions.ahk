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


#Include lib\_Config.ahk

#Include lib\Array.ahk
#Include lib\Explorer.ahk
#Include lib\Filesystem.ahk
#Include lib\String.ahk


;--------------------------------------------------------------------------------


WinrarArchiveActions_IsActive() {
	return Explorer_IsActive()
}


WinrarArchiveActions_WinrarExe() {
	return "C:\Program Files\WinRAR\WinRAR.exe"
}


WinrarArchiveActions_CheckFileIsArchive(ext) {
	return String_RegexMatches(ext, "rar|zip|cab|arj|lzh|tar|gz|zst|ace|uue|bz2|jar|iso|7z|z|zipx")
}


;--------------------------------------------------------------------------------


#If WinrarArchiveActions_IsActive()


~^+P::
~^+!P::
ArchiveWithWinrar:
{
	alt := GetKeyState("Alt")
	
	selectedItemPathList := Explorer_GetSelectedItemPathList()
	if (selectedItemPathList && Array_IsNotEmpty(selectedItemPathList)) {
		
		fileList := ""
		for index, selectedItemPath in selectedItemPathList {
			fileList .= (String_IsEmpty(inclusions) ? "" : " ") . """" . selectedItemPath . """"
		}
		
		SplitPath % Array_GetFirst(selectedItemPathList), name, dir, ext, nameNoExt, drive
		baseName := (Array_Length(selectedItemPathList) = 1) ? nameNoExt : dir
		baseName := String_RegexRemove(baseName, "^(.+\\)+")
		archive := Filesystem_GetUnusedFilename(dir, baseName, "rar")
		
		exe := WinrarArchiveActions_WinrarExe()
		if (alt) {
			try {
				RunWait "%exe%" a "%archive%" -m5 -ep1 -df -dr -ibck %fileList%
			}
		} else {
			try {
				RunWait "%exe%" a "%archive%" -m5 -ep1 -ibck %fileList%
			}
		}
	}
	return
}


~^+I::
~^+!I::
GZipWithWinrar:
{
	alt := GetKeyState("Alt")
	
	selectedItemPathList := Explorer_GetSelectedItemPathList()
	if (selectedItemPathList && Array_IsNotEmpty(selectedItemPathList)) {
		
		for index, selectedItemPath in selectedItemPathList {
			SplitPath selectedItemPath, name, dir, ext, nameNoExt, drive
			archive := Filesystem_GetUnusedFilename(dir, name, "gz")
			
			exe := WinrarArchiveActions_WinrarExe()
			if (alt) {
				try {
					RunWait "%exe%" a "%archive%" -m5 -ep1 -df -dr -ibck "%selectedItemPath%"
				}
			} else {
				try {
					RunWait "%exe%" a "%archive%" -m5 -ep1 -ibck "%selectedItemPath%"
				}
			}
		}
	}
	return
}


~^+O::
~^+!O::
ExtractWithWinrar:
{
	alt := GetKeyState("Alt")
	
	selectedItemPathList := Explorer_GetSelectedItemPathList()
	if (selectedItemPathList && Array_IsNotEmpty(selectedItemPathList)) {
		
		for index, selectedItemPath in selectedItemPathList {
			SplitPath selectedItemPath, name, dir, ext, nameNoExt, drive
			if (WinrarArchiveActions_CheckFileIsArchive(ext)) {
				
				exe := WinrarArchiveActions_WinrarExe()
				if (alt) {
					try {
						RunWait "%exe%" x "%selectedItemPath%" -df -dr -ibck "%dir%"
					}
					if (Filesystem_FileExists(selectedItemPath)) {
						Filesystem_RecycleFile(selectedItemPath)
					}
				} else {
					try {
						RunWait "%exe%" x "%selectedItemPath%" -ibck "%dir%"
					}
				}
			}
		}
	}
	return
}


#If


;--------------------------------------------------------------------------------
