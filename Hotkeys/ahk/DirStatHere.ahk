#NoTrayIcon

+F3::
DirStatHere:
activeFolder := Explorer_GetActiveFolder()
if activeFolder
	Run, "C:\Program Files (x86)\WinDirStat\windirstat.exe" "%activeFolder%"
Return

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
