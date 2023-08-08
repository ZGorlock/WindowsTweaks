;--------------------------------------------------------------------------------
; CustomNumpadMacros.ahk
;--------------------------------------------------------------------------------
; ~Ctrl+Alt+Numpad#  ; Runs the custom macro defined for Numpad0, ..., Numpad9  ;
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


CustomMacroBat(id) {
	Return "CustomMacro_" . id . ".bat"
}


RunCustomMacro(id) {
	bat := CustomMacroBat(id)
	Try Run "%bat%", , Hide
}


;--------------------------------------------------------------------------------


~^!Numpad0::
CustomMacro0:
KeyWait Numpad0
RunCustomMacro(0)
Return


~^!Numpad1::
CustomMacro1:
KeyWait Numpad1
RunCustomMacro(1)
Return


~^!Numpad2::
CustomMacro2:
KeyWait Numpad2
RunCustomMacro(2)
Return


~^!Numpad3::
CustomMacro3:
KeyWait Numpad3
RunCustomMacro(3)
Return


~^!Numpad4::
CustomMacro4:
KeyWait Numpad4
RunCustomMacro(4)
Return


~^!Numpad5::
CustomMacro5:
KeyWait Numpad5
RunCustomMacro(5)
Return


~^!Numpad6::
CustomMacro6:
KeyWait Numpad6
RunCustomMacro(6)
Return


~^!Numpad7::
CustomMacro7:
KeyWait Numpad7
RunCustomMacro(7)
Return


~^!Numpad8::
CustomMacro8:
KeyWait Numpad8
RunCustomMacro(8)
Return


~^!Numpad9::
CustomMacro9:
KeyWait Numpad9
RunCustomMacro(9)
Return


;--------------------------------------------------------------------------------
