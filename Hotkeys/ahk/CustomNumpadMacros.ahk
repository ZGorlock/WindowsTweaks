;--------------------------------------------------------------------------------
; CustomNumpadMacros.ahk
;--------------------------------------------------------------------------------
; Ctrl+Alt+Numpad0   ; Executes CustomMacro_0.bat accessible on the system path ;
; Ctrl+Alt+Numpad1   ; Executes CustomMacro_1.bat accessible on the system path ;
; Ctrl+Alt+Numpad2   ; Executes CustomMacro_2.bat accessible on the system path ;
; Ctrl+Alt+Numpad3   ; Executes CustomMacro_3.bat accessible on the system path ;
; Ctrl+Alt+Numpad4   ; Executes CustomMacro_4.bat accessible on the system path ;
; Ctrl+Alt+Numpad5   ; Executes CustomMacro_5.bat accessible on the system path ;
; Ctrl+Alt+Numpad6   ; Executes CustomMacro_6.bat accessible on the system path ;
; Ctrl+Alt+Numpad7   ; Executes CustomMacro_7.bat accessible on the system path ;
; Ctrl+Alt+Numpad8   ; Executes CustomMacro_8.bat accessible on the system path ;
; Ctrl+Alt+Numpad9   ; Executes CustomMacro_9.bat accessible on the system path ;
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


CustomNumpadMacros_IsActive() {
	Return TRUE
}


CustomMacroBat(id) {
	Return "CustomMacro_" . id . ".bat"
}


RunCustomMacro(id) {
	bat := CustomMacroBat(id)
	Try Run "%bat%", , Hide
}


;--------------------------------------------------------------------------------


#If CustomNumpadMacros_IsActive()


^!Numpad0::
^!NumpadIns::
CustomMacro0:
KeyWait Numpad0
KeyWait NumpadIns
RunCustomMacro(0)
Return


^!Numpad1::
^!NumpadEnd::
CustomMacro1:
KeyWait Numpad1
KeyWait NumpadEnd
RunCustomMacro(1)
Return


^!Numpad2::
^!NumpadDown::
CustomMacro2:
KeyWait Numpad2
KeyWait NumpadDown
RunCustomMacro(2)
Return


^!Numpad3::
^!NumpadPgDn::
CustomMacro3:
KeyWait Numpad3
KeyWait NumpadPgDn
RunCustomMacro(3)
Return


^!Numpad4::
^!NumpadLeft::
CustomMacro4:
KeyWait Numpad4
KeyWait NumpadLeft
RunCustomMacro(4)
Return


^!Numpad5::
^!NumpadClear::
CustomMacro5:
KeyWait Numpad5
KeyWait NumpadClear
RunCustomMacro(5)
Return


^!Numpad6::
^!NumpadRight::
CustomMacro6:
KeyWait Numpad6
KeyWait NumpadRight
RunCustomMacro(6)
Return


^!Numpad7::
^!NumpadHome::
CustomMacro7:
KeyWait Numpad7
KeyWait NumpadHome
RunCustomMacro(7)
Return


^!Numpad8::
^!NumpadUp::
CustomMacro8:
KeyWait Numpad8
KeyWait NumpadUp
RunCustomMacro(8)
Return


^!Numpad9::
^!NumpadPgUp::
CustomMacro9:
KeyWait Numpad9
KeyWait NumpadPgUp
RunCustomMacro(9)
Return


#If


;--------------------------------------------------------------------------------
