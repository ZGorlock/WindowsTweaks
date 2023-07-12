;--------------------------------------------------------------------------------
; WinrarArchiveActions.ahk
;--------------------------------------------------------------------------------
;
; Ctrl+Shift+P		->	Add selected file to winrar rar archive
; Ctrl+Shift+Alt+P	->	Add selected file to winrar rar archive and delete
;
; Ctrl+Shift+I		->	Add selected file to winrar gzip archive
; Ctrl+Shift+Alt+I	->	Add selected file to winrar gzip archive and delete
;
; Ctrl+Shift+O		->	Extract selected winrar archive
; Ctrl+Shift+Alt+O	->	Extract selected winrar archive and delete (NOT WORKING)
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


Explorer_GetSelection() {
    WinGetClass, winClass, % "ahk_id" . hWnd := WinExist("A")
    if !(winClass ~="Progman|WorkerW|(Cabinet|Explore)WClass")
        Return

    shellWindows := ComObjCreate("Shell.Application").Windows
    if (winClass ~= "Progman|WorkerW")
        shellFolderView := shellWindows.FindWindowSW(0, 0, SWC_DESKTOP := 8, 0, SWFO_NEEDDISPATCH := 1).Document
    else {
        for window in shellWindows
            if (hWnd = window.HWND) && (shellFolderView := window.Document)
            break
    }
    for item in shellFolderView.SelectedItems
        result .= (result = "" ? "" : "`n") . item.Path
    if !result
        result := shellFolderView.Folder.Self.Path
    Return result
}

Winrar_CheckFileIsArchive(ext) {
	return (ext ~= "^(?i:rar|zip|cab|arj|lzh|tar|gz|zst|ace|uue|bz2|jar|iso|7z|z|zipx)$")
}


global WINRAR_EXE := "C:\Program Files\WinRAR\WinRAR.exe"


;--------------------------------------------------------------------------------


^+P::
ArchiveWithWinrar:
selectedFile := Explorer_GetSelection()
if selectedFile {
	SplitPath selectedFile, name, dir, ext, nameNoExt, drive
	Run "%WINRAR_EXE%" a "%dir%\%nameNoExt%.rar" -m5 -ep1 -ibck "%selectedFile%"
}
Return


^+!P::
ArchiveAndDeleteWithWinrar:
selectedFile := Explorer_GetSelection()
if selectedFile {
	SplitPath selectedFile, name, dir, ext, nameNoExt, drive
	Run "%WINRAR_EXE%" a "%dir%\%nameNoExt%.rar" -m5 -ep1 -df -dr -ibck "%selectedFile%"
}
Return


^+I::
GZipWithWinrar:
selectedFile := Explorer_GetSelection()
if selectedFile {
	SplitPath selectedFile, name, dir, ext, nameNoExt, drive
	Run "%WINRAR_EXE%" a "%dir%\%nameNoExt%.%ext%.gz" -m5 -ep1 -ibck "%selectedFile%"
}
Return


^+!I::
GZipAndDeleteWithWinrar:
selectedFile := Explorer_GetSelection()
if selectedFile {
	SplitPath selectedFile, name, dir, ext, nameNoExt, drive
	Run "%WINRAR_EXE%" a "%dir%\%nameNoExt%.%ext%.gz" -m5 -ep1 -df -dr -ibck "%selectedFile%"
}
Return


^+O::
ExtractWithWinrar:
selectedFile := Explorer_GetSelection()
if selectedFile {
	SplitPath selectedFile, name, dir, ext, nameNoExt, drive
	if Winrar_CheckFileIsArchive( ext ) {
		Run "%WINRAR_EXE%" x "%selectedFile%" -ibck "%dir%"
	}
}
Return


^+!O::
ExtractAndDeleteWithWinrar:
selectedFile := Explorer_GetSelection()
if selectedFile {
	SplitPath selectedFile, name, dir, ext, nameNoExt, drive
	if Winrar_CheckFileIsArchive( ext ) {
		Run "%WINRAR_EXE%" x "%selectedFile%" -df -dr -ibck "%dir%"
	}
}
Return


;--------------------------------------------------------------------------------
