;--------------------------------------------------------------------------------
; Clipboard.ahk
;--------------------------------------------------------------------------------


#Include lib\String.ahk


;--------------------------------------------------------------------------------


Clipboard_GetText() {
	return Clipboard
}


Clipboard_SetText(text) {
	Clipboard := text
}


Clipboard_Clear() {
	Clipboard_SetText("")
}


Clipboard_ContainsText() {
	return String_IsNotEmpty(Clipboard_GetText())
}


Clipboard_DoesNotContainText() {
	return !Clipboard_ContainsText()
}


Clipboard_Get() {
	return ClipboardAll
}


;--------------------------------------------------------------------------------
