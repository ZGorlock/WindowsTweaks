;--------------------------------------------------------------------------------
; NewTextDocument.ahk
;--------------------------------------------------------------------------------
; ~Ctrl+Shift+M      ; Create new .txt document in current directory            ;
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


#Include lib\Explorer.ahk


;--------------------------------------------------------------------------------


~^+M::
NewTextDocument:
activeView := Explorer_GetActiveView()
if activeView {
	activeFolder := activeView.Folder.Self.Path
	txtFile := activeFolder . "\New Text Document.txt"
	while FileExist(txtFile) {
		txtFile := activeFolder . "\New Text Document (" . (A_Index + 1) . ").txt"
	}
	Filesystem_CreateFile(txtFile)
	Explorer_RenameItem(txtFile)
}
Return


;--------------------------------------------------------------------------------
