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


Explorer_IsDir(path) {
	Return InStr(FileExist(path), "D")
}


global NOTEPAD_PLUS_PLUS_EXE := "C:\Program Files\Notepad++\notepad++.exe"


;--------------------------------------------------------------------------------


F1::
EditWithNotepad++:
selectedFile := Explorer_GetSelection()
if !Explorer_IsDir( selectedFile ) {
	Run "%NOTEPAD_PLUS_PLUS_EXE%" "%selectedFile%"
}
Return


;--------------------------------------------------------------------------------
