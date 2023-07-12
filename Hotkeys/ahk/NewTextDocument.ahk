;--------------------------------------------------------------------------------
; NewTextDocument.ahk
;--------------------------------------------------------------------------------
;
; Ctrl+Shift+M		->	Create new .txt document in current directory
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


Explorer_GetActiveView() {
	WinGetClass, winClass, % "ahk_id" . hWnd := WinExist("A")
	if !(winClass ~= "^(Progman|WorkerW|(Cabinet|Explore)WClass)$") {
		Return
	}
	shellWindows := ComObjCreate("Shell.Application").Windows
	if (winClass ~= "Progman|WorkerW") {
		shellFolderView := shellWindows.Item( ComObject(VT_UI4 := 0x13, SWC_DESKTOP := 0x8) ).Document
	} else {
		for window in shellWindows {
			if (hWnd = window.HWND) && (shellFolderView := window.Document) {
				break
			}
		}
	}
    Return shellFolderView
}

Explorer_CreateFile(itemPath) {
	FileAppend,, %itemPath%
}

Explorer_RenameItem(itemPath) {
	Explorer_GetActiveView().SelectItem(itemPath, 0x1F)
}


;--------------------------------------------------------------------------------


^+M::
NewTextDocument:
shellFolderView := Explorer_GetActiveView()
if shellFolderView {
	activeFolder := shellFolderView.Folder.Self.Path
	txtFile := activeFolder . "\New Text Document.txt"
	while FileExist( txtFile ) {
		txtFile := activeFolder . "\New Text Document (" . (A_Index + 1) . ").txt"
	}
	Explorer_CreateFile( txtFile )
	Explorer_RenameItem( txtFile )
}
Return


;--------------------------------------------------------------------------------
