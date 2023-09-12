;--------------------------------------------------------------------------------
; LaunchWindowsApps.ahk
;--------------------------------------------------------------------------------
; Ctrl+Alt+Numpad[.] ; Starts the Windows Snip & Sketch tool                    ;
; Ctrl+Alt+Numpad[+] ; Starts the Windows Calculator app                        ;
; Ctrl+Alt+Numpad[/] ; Starts the Windows Calendar app                          ;
; Ctrl+Alt+Numpad[*] ; Starts the Windows Mail app                              ;
; Ctrl+Alt+Numpad[-] ; Starts the Microsoft To Do app                           ;
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


LaunchWindowsApps_IsActive() {
	Return TRUE
}


WindowsSnipAndSketchUri() {
	Return "ms-screenclip:"
}


WindowsCalculatorUri() {
	Return "calculator:"
}


WindowsCalendarUri() {
	Return "outlookcal:"
}


WindowsMailUri() {
	Return "outlookmail:"
}


MicrosoftToDoUri() {
	Return "shell:appsFolder\Microsoft.Todos_8wekyb3d8bbwe!App"
}


LaunchWindowsApp(uri) {
	Try Run "%uri%"
}


;--------------------------------------------------------------------------------


#If LaunchWindowsApps_IsActive()


^!NumpadDot::
LaunchScreenSnip:
KeyWait NumpadDot
uri := WindowsSnipAndSketchUri()
LaunchWindowsApp(uri)
Return


^!NumpadAdd::
LaunchCalculator:
KeyWait NumpadAdd
uri := WindowsCalculatorUri()
LaunchWindowsApp(uri)
Return


^!NumpadDiv::
LaunchCalendar:
KeyWait NumpadDiv
uri := WindowsCalendarUri()
LaunchWindowsApp(uri)
Return


^!NumpadMult::
LaunchMail:
KeyWait NumpadMult
uri := WindowsMailUri()
LaunchWindowsApp(uri)
Return


^!NumpadSub::
LaunchMicrosoftToDo:
KeyWait NumpadSub
uri := MicrosoftToDoUri()
LaunchWindowsApp(uri)
Return


#If


;--------------------------------------------------------------------------------
