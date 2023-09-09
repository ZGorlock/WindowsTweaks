;--------------------------------------------------------------------------------
; CustomNumpadMacros.ahk
;--------------------------------------------------------------------------------
; ~Ctrl+Alt+Numpad0  ; Executes CustomMacro_0.bat accessible on the system path ;
; ~Ctrl+Alt+Numpad1  ; Executes CustomMacro_1.bat accessible on the system path ;
; ~Ctrl+Alt+Numpad2  ; Executes CustomMacro_2.bat accessible on the system path ;
; ~Ctrl+Alt+Numpad3  ; Executes CustomMacro_3.bat accessible on the system path ;
; ~Ctrl+Alt+Numpad4  ; Executes CustomMacro_4.bat accessible on the system path ;
; ~Ctrl+Alt+Numpad5  ; Executes CustomMacro_5.bat accessible on the system path ;
; ~Ctrl+Alt+Numpad6  ; Executes CustomMacro_6.bat accessible on the system path ;
; ~Ctrl+Alt+Numpad7  ; Executes CustomMacro_7.bat accessible on the system path ;
; ~Ctrl+Alt+Numpad8  ; Executes CustomMacro_8.bat accessible on the system path ;
; ~Ctrl+Alt+Numpad9  ; Executes CustomMacro_9.bat accessible on the system path ;
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
