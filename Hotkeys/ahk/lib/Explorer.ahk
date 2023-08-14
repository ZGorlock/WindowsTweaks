;--------------------------------------------------------------------------------
; Explorer.ahk
;--------------------------------------------------------------------------------


Explorer_GetActiveView() {
	WinGetClass, winClass, % "ahk_id" . hWnd := WinExist("A")
	if !(winClass ~= "^(Progman|WorkerW|(Cabinet|Explore)WClass)$") {
		Return
	}
	shellWindows := ComObjCreate("Shell.Application").Windows
	if (winClass ~= "Progman|WorkerW") {
		shellFolderView := shellWindows.Item(ComObject(VT_UI4 := 0x13, SWC_DESKTOP := 0x8)).Document
	} else {
		for window in shellWindows {
			if (hWnd = window.HWND) && (shellFolderView := window.Document) {
				break
			}
		}
	}
    Return shellFolderView
}


Explorer_GetActivePath() {
	Return Explorer_GetActiveView().Folder.Self.Path
}


Explorer_IsActive() {
	Return Explorer_GetActiveView() ? true : false
}


Explorer_GetItemList() {
	items := []
	for item in Explorer_GetActiveView().Folder.Items {
		items.Push(item)
	}
	Return items
}


Explorer_GetItemPathList() {
	paths := []
	for index, item in Explorer_GetItemList() {
		paths.Push(item.Path)
	}
	Return paths
}


Explorer_CountItems() {
	Return Explorer_GetItemList().Length()
}


Explorer_GetSelectedItemList() {
	items := []
	for item in Explorer_GetActiveView().SelectedItems {
		items.Push(item)
	}
	Return items
}


Explorer_GetSelectedItemPathList() {
	paths := []
	for index, item in Explorer_GetSelectedItemList() {
		paths.Push(item.Path)
	}
	Return paths
}


Explorer_CountSelectedItems() {
	Return Explorer_GetSelectedItemList().Length()
}


Explorer_GetSelectedItem() {
	selectedItems := Explorer_GetSelectedItemList()
	Return selectedItems.Length() > 1 ? "" : selectedItems[1]
}


Explorer_GetSelectedItemPath() {
	Return Explorer_GetSelectedItem().Path
}


Explorer_SelectItem(itemPath) {
	Explorer_GetActiveView().SelectItem(itemPath, 0x1D)
}


Explorer_RenameItem(itemPath) {
	Explorer_GetActiveView().SelectItem(itemPath, 0x1F)
}


Explorer_IsEnteringText() {
	ControlGetFocus, vCtlClassNN, A
	Return (SubStr(vCtlClassNN, 1, 4) = "Edit") || (SubStr(vCtlClassNN, 1, 27) = "Windows.UI.Core.CoreWindow1")
}


Explorer_IsRenamingItem() {
	ControlGet, vCtlStyle, Style, , % vCtlClassNN, A
	Return Explorer_IsEnteringText() && ((vCtlStyle = 0x50000080) || (vCtlStyle = 0x540000C5))
}


Explorer_IsTypingInSearchBar() {
	ControlGet, vCtlStyle, Style, , % vCtlClassNN, A
	Return Explorer_IsEnteringText() && (vCtlStyle = 0x48000080)
}


Explorer_IsTypingInAddressBar() {
	ControlGet, vCtlStyle, Style, , % vCtlClassNN, A
	Return Explorer_IsEnteringText() && (vCtlStyle = 0x54000080)
}


;--------------------------------------------------------------------------------
