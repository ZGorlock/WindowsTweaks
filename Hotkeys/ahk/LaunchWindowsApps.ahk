;--------------------------------------------------------------------------------
; LaunchWindowsApps.ahk
;--------------------------------------------------------------------------------
; Ctrl+Alt+Numpad[.] ; Starts the Windows Task Manager                          ;
; Ctrl+Alt+Numpad[=] ; Starts the Windows Snip & Sketch tool                    ;
; Ctrl+Alt+Numpad[+] ; Starts the Windows Calculator app                        ;
; Ctrl+Alt+Numpad[/] ; Starts the Windows Calendar app                          ;
; Ctrl+Alt+Numpad[*] ; Starts the Windows Mail app                              ;
; Ctrl+Alt+Numpad[-] ; Starts the Microsoft To Do app                           ;
;--------------------------------------------------------------------------------


#Include lib\_Config.ahk


;--------------------------------------------------------------------------------


LaunchWindowsApps_IsActive() {
	return TRUE
}


LaunchWindowsApps_WindowsTaskManagerUri() {
	return "taskmgr"
}


LaunchWindowsApps_WindowsSnipAndSketchUri() {
	return "ms-screenclip:"
}


LaunchWindowsApps_WindowsCalculatorUri() {
	return "calculator:"
}


LaunchWindowsApps_WindowsCalendarUri() {
	return "outlookcal:"
}


LaunchWindowsApps_WindowsMailUri() {
	return "outlookmail:"
}


LaunchWindowsApps_MicrosoftToDoUri() {
	return "shell:appsFolder\Microsoft.Todos_8wekyb3d8bbwe!App"
}


LaunchWindowsApps_LaunchApp(uri) {
	if (uri) {
		try {
			Run "%uri%"
		}
	}
}


;--------------------------------------------------------------------------------


#If LaunchWindowsApps_IsActive()


^!NumpadDot::
^!NumpadDel::
LaunchTaskManager:
{
	KeyWait NumpadDot
	KeyWait NumpadDel
	uri := LaunchWindowsApps_WindowsTaskManagerUri()
	LaunchWindowsApps_LaunchApp(uri)
	return
}


^!NumpadEnter::
LaunchScreenSnip:
{
	KeyWait NumpadEnter
	uri := LaunchWindowsApps_WindowsSnipAndSketchUri()
	LaunchWindowsApps_LaunchApp(uri)
	return
}


^!NumpadAdd::
LaunchCalculator:
{
	KeyWait NumpadAdd
	uri := LaunchWindowsApps_WindowsCalculatorUri()
	LaunchWindowsApps_LaunchApp(uri)
	return
}


^!NumpadDiv::
LaunchCalendar:
{
	KeyWait NumpadDiv
	uri := LaunchWindowsApps_WindowsCalendarUri()
	LaunchWindowsApps_LaunchApp(uri)
	return
}


^!NumpadMult::
LaunchMail:
{
	KeyWait NumpadMult
	uri := LaunchWindowsApps_WindowsMailUri()
	LaunchWindowsApps_LaunchApp(uri)
	return
}


^!NumpadSub::
LaunchMicrosoftToDo:
{
	KeyWait NumpadSub
	uri := LaunchWindowsApps_MicrosoftToDoUri()
	LaunchWindowsApps_LaunchApp(uri)
	return
}


#If


;--------------------------------------------------------------------------------
