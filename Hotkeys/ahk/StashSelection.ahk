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
	Return Explorer_IsActive() || ImageGlass_IsActive() || IrfanView_IsActive() || VLC_IsActive() || XnView_IsActive()
}


ImageGlass_IsActive() {
	Return String_Equals(Desktop_GetActiveWindowProcessName(), "ImageGlass.exe")
}


IrfanView_IsActive() {
	Return String_Equals(Desktop_GetActiveWindowProcessName(), "i_view64.exe")
}


VLC_IsActive() {
	Return String_Equals(Desktop_GetActiveWindowProcessName(), "vlc.exe")
}


XnView_IsActive() {
	Return String_Equals(Desktop_GetActiveWindowProcessName(), "xnviewmp.exe")
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
		selection := ImageGlass_GetSelected()
	} else if IrfanView_IsActive() {
		selection := IrfanView_GetSelected()
	} else if VLC_IsActive() {
		selection := VLC_GetSelected()
	} else if XnView_IsActive() {
		selection := XnView_GetSelected()
	}
	Return selection
}


ImageGlass_GetSelected() {
	selection := []
	
	title := Desktop_GetActiveWindowTitle()
	fileName := String_Trim(String_LSnip(title, String_IndexOf(title, "|") - 1))
	
	pid := Desktop_GetActiveWindowProcessId()
	fileHandles := Desktop_GetFileHandles(pid)
	filePath := Array_GetFirst(fileHandles)
	
	file := filePath . "\" . fileName
	
	if Filesystem_FileExists(file) {
		selection.Push(file)
	}
	Return selection
}


IrfanView_GetSelected() {
	selection := []
	
	title := Desktop_GetActiveWindowTitle()
	fileName := String_Trim(String_LSnip(title, String_IndexOf(title, " - IrfanView") - 1))
	
	pid := Desktop_GetActiveWindowProcessId()
	fileHandles := Desktop_GetFileHandles(pid)
	filePath := fileHandles[2]
	
	file := filePath . "\" . fileName
	
	if Filesystem_FileExists(file) {
		selection.Push(file)
	}
	Return selection
}


VLC_GetSelected() {
	selection := []
	
	title := Desktop_GetActiveWindowTitle()
	fileUri := String_Trim(String_Remove(title, " - VLC media player"))
	
	file := String_Replace(String_Remove(fileUri, "file:///"), "/", "\")
	
	if Filesystem_FileExists(file) {
		selection.Push(file)
	}
	Return selection
}


XnView_GetSelected() {
	selection := []
	
	title := Desktop_GetActiveWindowTitle()
	file := String_Trim(String_Remove(title, " - XnView MP"))
	
	if Filesystem_FileExists(file) {
		selection.Push(file)
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
