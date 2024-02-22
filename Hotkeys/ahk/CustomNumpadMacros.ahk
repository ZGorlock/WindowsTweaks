;--------------------------------------------------------------------------------
; CustomNumpadMacros.ahk
;--------------------------------------------------------------------------------
; Ctrl+Alt+Numpad0   ; Executes CustomMacro_0.bat located in the usr\ directory ;
; Ctrl+Alt+Numpad1   ; Executes CustomMacro_1.bat located in the usr\ directory ;
; Ctrl+Alt+Numpad2   ; Executes CustomMacro_2.bat located in the usr\ directory ;
; Ctrl+Alt+Numpad3   ; Executes CustomMacro_3.bat located in the usr\ directory ;
; Ctrl+Alt+Numpad4   ; Executes CustomMacro_4.bat located in the usr\ directory ;
; Ctrl+Alt+Numpad5   ; Executes CustomMacro_5.bat located in the usr\ directory ;
; Ctrl+Alt+Numpad6   ; Executes CustomMacro_6.bat located in the usr\ directory ;
; Ctrl+Alt+Numpad7   ; Executes CustomMacro_7.bat located in the usr\ directory ;
; Ctrl+Alt+Numpad8   ; Executes CustomMacro_8.bat located in the usr\ directory ;
; Ctrl+Alt+Numpad9   ; Executes CustomMacro_9.bat located in the usr\ directory ;
;--------------------------------------------------------------------------------


#Include lib\_Config.ahk


;--------------------------------------------------------------------------------


CustomNumpadMacros_IsActive() {
	return TRUE
}


CustomNumpadMacros_CustomMacroBatPath() {
	return "usr\"
}


CustomNumpadMacros_CustomMacroBat(id := -1) {
	if (id >= 0) {
		path := CustomNumpadMacros_CustomMacroBatPath()
		bat := "CustomMacro_" . id . ".bat"
		return path . "\" . bat
	}
}


CustomNumpadMacros_RunMacro(id) {
	bat := CustomNumpadMacros_CustomMacroBat(id)
	if (bat) {
		try {
			Run "%bat%", , Hide
		}
	}
}


;--------------------------------------------------------------------------------


#If CustomNumpadMacros_IsActive()


^!Numpad0::
^!NumpadIns::
CustomMacro0:
{
	KeyWait Numpad0
	KeyWait NumpadIns
	CustomNumpadMacros_RunMacro(0)
	return
}


^!Numpad1::
^!NumpadEnd::
CustomMacro1:
{
	KeyWait Numpad1
	KeyWait NumpadEnd
	CustomNumpadMacros_RunMacro(1)
	return
}


^!Numpad2::
^!NumpadDown::
CustomMacro2:
{
	KeyWait Numpad2
	KeyWait NumpadDown
	CustomNumpadMacros_RunMacro(2)
	return
}


^!Numpad3::
^!NumpadPgDn::
CustomMacro3:
{
	KeyWait Numpad3
	KeyWait NumpadPgDn
	CustomNumpadMacros_RunMacro(3)
	return
}


^!Numpad4::
^!NumpadLeft::
CustomMacro4:
{
	KeyWait Numpad4
	KeyWait NumpadLeft
	CustomNumpadMacros_RunMacro(4)
	return
}


^!Numpad5::
^!NumpadClear::
CustomMacro5:
{
	KeyWait Numpad5
	KeyWait NumpadClear
	CustomNumpadMacros_RunMacro(5)
	return
}


^!Numpad6::
^!NumpadRight::
CustomMacro6:
{
	KeyWait Numpad6
	KeyWait NumpadRight
	CustomNumpadMacros_RunMacro(6)
	return
}


^!Numpad7::
^!NumpadHome::
CustomMacro7:
{
	KeyWait Numpad7
	KeyWait NumpadHome
	CustomNumpadMacros_RunMacro(7)
	return
}


^!Numpad8::
^!NumpadUp::
CustomMacro8:
{
	KeyWait Numpad8
	KeyWait NumpadUp
	CustomNumpadMacros_RunMacro(8)
	return
}


^!Numpad9::
^!NumpadPgUp::
CustomMacro9:
{
	KeyWait Numpad9
	KeyWait NumpadPgUp
	CustomNumpadMacros_RunMacro(9)
	return
}


#If


;--------------------------------------------------------------------------------
