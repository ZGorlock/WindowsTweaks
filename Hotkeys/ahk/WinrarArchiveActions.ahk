#NoTrayIcon


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


^+P::
ArchiveWithWinrar:
selectedFile := Explorer_GetSelection()
if selectedFile
	SplitPath selectedFile, name, dir, ext, nameNoExt, drive
	Run, C:\Program Files\WinRAR\WinRAR.exe a "%dir%\%nameNoExt%.rar" -m5 -ep1 -ibck "%selectedFile%"
Return


^+!P::
ArchiveAndDeleteWithWinrar:
selectedFile := Explorer_GetSelection()
if selectedFile
	SplitPath selectedFile, name, dir, ext, nameNoExt, drive
	Run, C:\Program Files\WinRAR\WinRAR.exe a "%dir%\%nameNoExt%.rar" -m5 -ep1 -dr -ibck "%selectedFile%"
Return


^+O::
ExtractWithWinrar:
selectedFile := Explorer_GetSelection()
if selectedFile
	SplitPath selectedFile, name, dir, ext, nameNoExt, drive
	rar_ext := "rar"
	if (%ext% = %rar_ext%)
		Run, C:\Program Files\WinRAR\WinRAR.exe x "%selectedFile%" -ibck "%dir%"
Return


^+!O::
ExtractAndDeleteWithWinrar:
selectedFile := Explorer_GetSelection()
if selectedFile
	SplitPath selectedFile, name, dir, ext, nameNoExt, drive
	rar_ext := "rar"
	if (%ext% = %rar_ext%)
		Run, C:\Program Files\WinRAR\WinRAR.exe x "%selectedFile%" -dr -ibck "%dir%"
Return
