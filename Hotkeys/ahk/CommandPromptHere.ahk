;--------------------------------------------------------------------------------
; CommandPromptHere.ahk
;--------------------------------------------------------------------------------
;
; Ctrl+Shift+C		->	Open command prompt in current directory
; Ctrl+Shift+Alt+C	->	Open command prompt in current directory as Admin
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


Explorer_GetActiveFolder() {
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
    Return shellFolderView.Folder.Self.Path
}


global CMD_EXE := "C:\Windows\System32\cmd.exe"


;--------------------------------------------------------------------------------


^+C::
CommandPromptHere:
activeFolder := Explorer_GetActiveFolder()
if activeFolder {
	Run "%CMD_EXE%" /k cd /d "%activeFolder%"
}
Return


^+!C::
AdminCommandPromptHere:
activeFolder := Explorer_GetActiveFolder()
if activeFolder {
	Run *RunAs "%CMD_EXE%" /k cd /d "%activeFolder%"
}
Return


;--------------------------------------------------------------------------------
