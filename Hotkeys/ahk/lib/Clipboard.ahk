;--------------------------------------------------------------------------------
; Clipboard.ahk
;--------------------------------------------------------------------------------


#Include lib\String.ahk


Clipboard_GetText() {
	Return Clipboard
}


Clipboard_SetText(text) {
	Clipboard := text
}


Clipboard_Clear() {
	Clipboard_SetText("")
}


Clipboard_ContainsText() {
	Return String_IsNotEmpty(Clipboard_GetText())
}


Clipboard_DoesNotContainText() {
	Return !Clipboard_ContainsText()
}


Clipboard_Get() {
	Return ClipboardAll
}


;--------------------------------------------------------------------------------
