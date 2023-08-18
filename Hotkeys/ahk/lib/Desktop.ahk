;--------------------------------------------------------------------------------
; Desktop.ahk
;--------------------------------------------------------------------------------


Desktop_GetActiveWindowId() {
	Return WinExist("A")
}


Desktop_GetActiveWindowClass() {
	WinGetClass, winClass, A
	Return winClass
}


Desktop_GetActiveWindowProcessName() {
	WinGet, winProcessName, ProcessName, A
	Return winProcessName
}


Desktop_GetActiveWindowProcessPath() {
	WinGet, winProcessPath, ProcessPath, A
	Return winProcessPath
}


Desktop_GetActiveWindowProcessId() {
	WinGet, winPid, PID, A
	Return winPid
}


Desktop_GetActiveWindowTitle() {
	WinGetTitle, winTitle, A
	Return winTitle
}


Desktop_GetMousePosition(byref mouseX, byref mouseY) {
	CoordMode, Mouse, Screen
	MouseGetPos, mouseX, mouseY
	Return
}


Desktop_GetFocusedControlClass() {
	ControlGetFocus, controlClass, A
	Return controlClass
}


Desktop_GetFocusedControlStyle() {
	ControlGet, controlStyle, Style, , % Desktop_GetFocusedControlClass(), A
	Return controlStyle
}


Desktop_GetFocusedControlExtendedStyle() {
	ControlGet, controlExStyle, ExStyle, , % Desktop_GetFocusedControlClass(), A
	Return controlExStyle
}


;--------------------------------------------------------------------------------
