;--------------------------------------------------------------------------------
; InvertSelection.ahk
;--------------------------------------------------------------------------------
;
; Ctrl+I			->	Invert the current selection in Explorer
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


;--------------------------------------------------------------------------------


^I::
InvertSelection:
shellFolderView := Explorer_GetActiveView()
if shellFolderView {
	KeyWait Ctrl
	Send !HSI
}
Return


;--------------------------------------------------------------------------------
