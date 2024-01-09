;--------------------------------------------------------------------------------
; Explorer.ahk
;--------------------------------------------------------------------------------


#Include lib\Desktop.ahk
#Include lib\Filesystem.ahk
#Include lib\String.ahk


;--------------------------------------------------------------------------------


Explorer_IsActive() {
	return String_RegexMatches(Desktop_GetActiveWindowClass(), "(Cabinet|Explore)WClass")
}


Explorer_OnDesktop() {
	return String_RegexMatches(Desktop_GetActiveWindowClass(), "Progman|WorkerW")
}


Explorer_GetActiveView() {
	if (!Explorer_IsActive()) {
		return
	}
	
	shellWindows := ComObjCreate("Shell.Application").Windows
	if (String_RegexMatches(Desktop_GetActiveWindowClass(), "Progman|WorkerW")) {
		shellFolderView := shellWindows.Item(ComObject((VT_UI4 := 0x13), (SWC_DESKTOP := 0x8))).Document
	} else {
		hWnd := Desktop_GetActiveWindowId()
		for window in shellWindows {
			if ((hWnd = window.HWND) && (shellFolderView := window.Document)) {
				break
			}
		}
	}
	
	return shellFolderView
}


Explorer_GetActivePath() {
	return Explorer_GetActiveView().Folder.Self.Path
}


Explorer_GetItemList(type := "") {
	items := []
	folderItems := Explorer_GetActiveView().Folder.Items
	for item in folderItems {
		if (Filesystem_IsType(item.Path, type)) {
			items.Push(item)
		}
	}
	return items
}


Explorer_GetItemPathList(type := "") {
	paths := []
	itemList := Explorer_GetItemList(type)
	for index, item in itemList {
		paths.Push(item.Path)
	}
	return paths
}


Explorer_CountItems(type := "") {
	return Explorer_GetItemList(type).Length()
}


Explorer_GetSelectedItemList(type := "") {
	items := []
	selectedItems := Explorer_GetActiveView().SelectedItems
	for item in selectedItems {
		if (Filesystem_IsType(item.Path, type)) {
			items.Push(item)
		}
	}
	return items
}


Explorer_GetSelectedItemPathList(type := "") {
	paths := []
	selectedItemList := Explorer_GetSelectedItemList(type)
	for index, item in selectedItemList {
		paths.Push(item.Path)
	}
	return paths
}


Explorer_CountSelectedItems(type := "") {
	return Explorer_GetSelectedItemList(type).Length()
}


Explorer_GetSelectedItem() {
	selectedItems := Explorer_GetSelectedItemList()
	return (selectedItems.Length() > 1) ? "" : selectedItems[1]
}


Explorer_GetSelectedItemPath() {
	return Explorer_GetSelectedItem().Path
}


Explorer_SelectItem(itemPath) {
	Explorer_GetActiveView().SelectItem(itemPath, 0x1D)
}


Explorer_RenameItem(itemPath) {
	Explorer_GetActiveView().SelectItem(itemPath, 0x1F)
}


Explorer_IsEnteringText() {
	vCtlClassNN := Desktop_GetFocusedControlClass()
	return String_StartsWith(vCtlClassNN, "Edit") || String_StartsWith(vCtlClassNN, "Windows.UI.Core.CoreWindow")
}


Explorer_IsRenamingItem() {
	vCtlStyle := Desktop_GetFocusedControlStyle()
	return Explorer_IsEnteringText() && ((vCtlStyle = 0x50000080) || (vCtlStyle = 0x540000C5))
}


Explorer_IsTypingInSearchBar() {
	vCtlStyle := Desktop_GetFocusedControlStyle()
	return Explorer_IsEnteringText() && (vCtlStyle = 0x48000080)
}


Explorer_IsTypingInAddressBar() {
	vCtlStyle := Desktop_GetFocusedControlStyle()
	return Explorer_IsEnteringText() && (vCtlStyle = 0x54000080)
}


;--------------------------------------------------------------------------------
