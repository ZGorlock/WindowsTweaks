;--------------------------------------------------------------------------------
; Explorer.ahk
;--------------------------------------------------------------------------------


#Include lib\Desktop.ahk
#Include lib\Filesystem.ahk
#Include lib\String.ahk


Explorer_IsActive(includeDesktop:=FALSE) {
	winClass := Desktop_GetActiveWindowClass()
	pattern := (includeDesktop ? "Progman|WorkerW|" : "") . "(Cabinet|Explore)WClass"
	Return String_RegexMatches(winClass, pattern)
}


Explorer_GetActiveView() {
	if !Explorer_IsActive() {
		Return
	}
	shellWindows := ComObjCreate("Shell.Application").Windows
	if (String_RegexMatches(Desktop_GetActiveWindowClass(), "Progman|WorkerW")) {
		shellFolderView := shellWindows.Item(ComObject(VT_UI4 := 0x13, SWC_DESKTOP := 0x8)).Document
	} else {
		hWnd := Desktop_GetActiveWindowId()
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


Explorer_GetItemList(type:="") {
	items := []
	for item in Explorer_GetActiveView().Folder.Items {
		if Filesystem_IsType(item.Path, type) {
			items.Push(item)
		}
	}
	Return items
}


Explorer_GetItemPathList(type:="") {
	paths := []
	for index, item in Explorer_GetItemList(type) {
		paths.Push(item.Path)
	}
	Return paths
}


Explorer_CountItems(type:="") {
	Return Explorer_GetItemList(type).Length()
}


Explorer_GetSelectedItemList(type:="") {
	items := []
	for item in Explorer_GetActiveView().SelectedItems {
		if Filesystem_IsType(item.Path, type) {
			items.Push(item)
		}
	}
	Return items
}


Explorer_GetSelectedItemPathList(type:="") {
	paths := []
	for index, item in Explorer_GetSelectedItemList(type) {
		paths.Push(item.Path)
	}
	Return paths
}


Explorer_CountSelectedItems(type:="") {
	Return Explorer_GetSelectedItemList(type).Length()
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
	vCtlClassNN := Desktop_GetFocusedControlClass()
	Return (SubStr(vCtlClassNN, 1, 4) = "Edit") || (SubStr(vCtlClassNN, 1, 26) = "Windows.UI.Core.CoreWindow")
}


Explorer_IsRenamingItem() {
	vCtlStyle := Desktop_GetFocusedControlStyle()
	Return Explorer_IsEnteringText() && ((vCtlStyle = 0x50000080) || (vCtlStyle = 0x540000C5))
}


Explorer_IsTypingInSearchBar() {
	vCtlStyle := Desktop_GetFocusedControlStyle()
	Return Explorer_IsEnteringText() && (vCtlStyle = 0x48000080)
}


Explorer_IsTypingInAddressBar() {
	vCtlStyle := Desktop_GetFocusedControlStyle()
	Return Explorer_IsEnteringText() && (vCtlStyle = 0x54000080)
}


;--------------------------------------------------------------------------------
