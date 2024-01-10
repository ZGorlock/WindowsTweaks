;--------------------------------------------------------------------------------
; StashSelection.ahk
;--------------------------------------------------------------------------------
; Ctrl+S             ; Copy the selected file(s) to the defined stash location  ;
; Ctrl+Alt+S         ; Move the selected file(s) to the defined stash location  ;
;--------------------------------------------------------------------------------


#Include lib\_Config.ahk

#Include lib\Array.ahk
#Include lib\Desktop.ahk
#Include lib\Explorer.ahk
#Include lib\Filesystem.ahk
#Include lib\Sound.ahk
#Include lib\String.ahk


;--------------------------------------------------------------------------------


StashSelection_IsActive() {
	return Explorer_IsActive() || StashSelection_ImageGlass_IsActive() || StashSelection_IrfanView_IsActive() || StashSelection_VLC_IsActive() || StashSelection_XnView_IsActive()
}


StashSelection_ImageGlass_IsActive() {
	return String_Equals(Desktop_GetActiveWindowProcessName(), "ImageGlass.exe")
}


StashSelection_IrfanView_IsActive() {
	return String_Equals(Desktop_GetActiveWindowProcessName(), "i_view64.exe")
}


StashSelection_VLC_IsActive() {
	return String_Equals(Desktop_GetActiveWindowProcessName(), "vlc.exe")
}


StashSelection_XnView_IsActive() {
	return String_Equals(Desktop_GetActiveWindowProcessName(), "xnviewmp.exe")
}


StashSelection_StashDir() {
	EnvGet, stashDir, StashDir
	if (stashDir) {
		stashDir := stashDir . "\"
		stashDir := RegExReplace(stashDir, "[\\/]+", "\")
		return stashDir
	}
	return
}


StashSelection_GetSelected() {
	selection := []
	if (Explorer_IsActive()) {
		selection := Explorer_GetSelectedItemPathList()
	} else if (StashSelection_ImageGlass_IsActive()) {
		selection := StashSelection_ImageGlass_GetSelected()
	} else if (StashSelection_IrfanView_IsActive()) {
		selection := StashSelection_IrfanView_GetSelected()
	} else if (StashSelection_VLC_IsActive()) {
		selection := StashSelection_VLC_GetSelected()
	} else if (StashSelection_XnView_IsActive()) {
		selection := StashSelection_XnView_GetSelected()
	}
	return selection
}


StashSelection_ImageGlass_GetSelected() {
	selection := []
	
	title := Desktop_GetActiveWindowTitle()
	file := String_Trim(String_LSnip(title, String_IndexOf(title, "|") - 1))
	
	if (!Filesystem_FileExists(file)) {
		pid := Desktop_GetActiveWindowProcessId()
		fileHandles := Desktop_GetFileHandles(pid)
		fileHandles := Array_FilterNotStartsWith(fileHandles, "C:\Windows\")
		file := Array_GetLast(fileHandles) . "\" . file
	}
	
	if (Filesystem_FileExists(file)) {
		selection.Push(file)
	}
	return selection
}


StashSelection_IrfanView_GetSelected() {
	selection := []
	
	title := Desktop_GetActiveWindowTitle()
	file := String_Trim(String_LSnip(title, String_IndexOf(title, " - IrfanView") - 1))
	
	if (!Filesystem_FileExists(file)) {
		pid := Desktop_GetActiveWindowProcessId()
		fileHandles := Desktop_GetFileHandles(pid)
		fileHandles := Array_FilterNotStartsWith(fileHandles, "C:\Windows\")
		file := Array_GetLast(fileHandles) . "\" . file
	}
	
	if (Filesystem_FileExists(file)) {
		selection.Push(file)
	}
	return selection
}


StashSelection_VLC_GetSelected() {
	selection := []
	
	title := Desktop_GetActiveWindowTitle()
	file := String_Trim(String_Remove(title, " - VLC media player"))
	file := String_Replace(String_Remove(fileUri, "file:///"), "/", "\")
	
	if (!Filesystem_FileExists(file)) {
		pid := Desktop_GetActiveWindowProcessId()
		fileHandles := Desktop_GetFileHandles(pid)
		fileHandles := Array_FilterNotStartsWith(fileHandles, "C:\Windows\")
		fileHandles := Array_FilterNotContains(fileHandles, "\AppData\")
		file := Array_GetLast(fileHandles)
	}
	
	if (Filesystem_FileExists(file)) {
		selection.Push(file)
	}
	return selection
}


StashSelection_XnView_GetSelected() {
	selection := []
	
	title := Desktop_GetActiveWindowTitle()
	file := String_Trim(String_Remove(title, " - XnView MP"))
	
	if (Filesystem_FileExists(file)) {
		selection.Push(file)
	}
	return selection
}


StashSelection_CompletionWav() {
	return "C:\Windows\Media\Windows Message Nudge.wav"
}


StashSelection_PlayCompletionSound() {
	wav := StashSelection_CompletionWav()
	Sound_Play(wav)
}


;--------------------------------------------------------------------------------


#If StashSelection_IsActive()


^S::
^!S::
StashSelection:
{
	alt := GetKeyState("Alt")
	
	stashDir := StashSelection_StashDir()
	selectedFiles := StashSelection_GetSelected()
	if (stashDir && selectedFiles && Array_IsNotEmpty(selectedFiles)) {
		if (!Filesystem_FileExists(stashDir)) {
			Filesystem_CreateDir(stashDir)
		}
		
		for index, path in selectedFiles {
			if (alt) {
				Filesystem_Move(path, stashDir)
			} else {
				Filesystem_Copy(path, stashDir)
			}
		}
		;StashSelection_PlayCompletionSound()
	}
	return
}


#If


;--------------------------------------------------------------------------------
