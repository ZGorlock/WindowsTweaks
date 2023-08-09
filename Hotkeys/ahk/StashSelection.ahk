;--------------------------------------------------------------------------------
; StashSelection.ahk
;--------------------------------------------------------------------------------
; ~Ctrl+Q            ; Copy the selected file(s) to the defined stash location  ;
; ~Ctrl+Shift+Q      ; Move the selected file(s) to the defined stash location  ;
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
#Include lib\Filesystem.ahk
#Include lib\Sound.ahk


StashDir() {
	EnvGet, stashDir, STASH_DIR
	if stashDir {
		stashDir := stashDir . "\"
		stashDir := RegExReplace(stashDir, "[\\/]+", "\")
		Return stashDir
	}
	Return
}


CompletionWav() {
	Return "C:\Windows\Media\Windows Message Nudge.wav"
}


PlayCompletionSound() {
	wav := CompletionWav()
	Sound_PlayMedia(wav, 50)
}


;--------------------------------------------------------------------------------


~^Q::
CopySelectionToStash:
if Explorer_IsActive() {
	selectedFiles := Explorer_GetSelectedItemPathList()
	stashDir := StashDir()
	if selectedFiles && stashDir {
		for index, path in selectedFiles {
			Filesystem_Copy(path, stashDir)
		}
		;PlayCompletionSound()
	}
}
Return


~^+Q::
MoveSelectionToStash:
if Explorer_IsActive() {
	selectedFiles := Explorer_GetSelectedItemPathList()
	stashDir := StashDir()
	if selectedFiles && stashDir {
		for index, path in selectedFiles {
			Filesystem_Move(path, stashDir)
		}
		;PlayCompletionSound()
	}
}
Return


;--------------------------------------------------------------------------------