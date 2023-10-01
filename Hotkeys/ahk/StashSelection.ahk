;--------------------------------------------------------------------------------
; StashSelection.ahk
;--------------------------------------------------------------------------------
; Ctrl+S             ; Copy the selected file(s) to the defined stash location  ;
; Ctrl+Alt+S         ; Move the selected file(s) to the defined stash location  ;
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


#Include lib\Array.ahk
#Include lib\Desktop.ahk
#Include lib\Explorer.ahk
#Include lib\Filesystem.ahk
#Include lib\Sound.ahk
#Include lib\String.ahk


StashSelection_IsActive() {
	Return Explorer_IsActive() || ImageGlass_IsActive()
}


ImageGlass_IsActive() {
	Return String_Equals(Desktop_GetActiveWindowProcessName(), "ImageGlass.exe")
}


StashDir() {
	EnvGet, stashDir, StashDir
	if stashDir {
		stashDir := stashDir . "\"
		stashDir := RegExReplace(stashDir, "[\\/]+", "\")
		Return stashDir
	}
	Return
}


GetStashSelection() {
	selection := []
	if Explorer_IsActive() {
		selection := Explorer_GetSelectedItemPathList()
		
	} else if ImageGlass_IsActive() {
		title := Desktop_GetActiveWindowTitle()
		imageName := String_Trim(String_LSnip(title, String_IndexOf(title, "|") - 1))
		
		pid := Desktop_GetActiveWindowProcessId()
		fileHandles := Desktop_GetFileHandles(pid)
		imagePath := Array_GetFirst(fileHandles)
		
		image := imagePath . "\" . imageName
		if Filesystem_FileExists(image) {
			selection.Push(image)
		}
	}
	Return selection
}


CompletionWav() {
	Return "C:\Windows\Media\Windows Message Nudge.wav"
}


PlayCompletionSound() {
	wav := CompletionWav()
	Sound_PlayMedia(wav, 50)
}


;--------------------------------------------------------------------------------


#If StashSelection_IsActive()


^S::
^!S::
StashSelection:
alt := GetKeyState("Alt")
selectedFiles := GetStashSelection()
stashDir := StashDir()
if selectedFiles && stashDir {
	Filesystem_CreateDir(stashDir)
	for index, path in selectedFiles {
		if alt {
			Filesystem_Move(path, stashDir)
		} else {
			Filesystem_Copy(path, stashDir)
		}
	}
	;PlayCompletionSound()
}
Return


#If


;--------------------------------------------------------------------------------
