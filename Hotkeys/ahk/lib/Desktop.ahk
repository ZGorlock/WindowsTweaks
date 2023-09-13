;--------------------------------------------------------------------------------
; Desktop.ahk
;--------------------------------------------------------------------------------


#Include lib\String.ahk


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


Desktop_GetFileHandles(pid) {
	hProcess := DllCall("OpenProcess", "UInt", (PROCESS_DUP_HANDLE := 0x0040), "UInt", 0, "UInt", pid)
	
	handles := []
	res := size := 1
	while res != 0 {
		VarSetCapacity(buff, size, 0)
		res := DllCall("ntdll\NtQuerySystemInformation", "Int", (SystemExtendedHandleInformation := 0x40), "Ptr", &buff, "UInt", size, "UIntP", size, "UInt")
	}
	handleCount := NumGet(buff)
	
	Loop % handleCount {
		offset := (A_PtrSize * 2) + (((A_PtrSize * 3) + 16) * (A_Index - 1))
		processId := NumGet(buff, (offset := offset + A_PtrSize), "UInt")
		if (pid = processId) {
			handleValue := NumGet(buff, (offset := offset + A_PtrSize))
			DllCall("DuplicateHandle", "Ptr", hProcess, "Ptr", handleValue, "Ptr", DllCall("GetCurrentProcess"), "PtrP", lpTargetHandle, "UInt", 0, "UInt", 0, "UInt", (DUPLICATE_SAME_ACCESS := 0x2))
			
			VarSetCapacity(filePath, 1026)
			if ((DllCall("GetFileType", "Ptr", lpTargetHandle) = (FILE_TYPE_DISK := 0x1)) && DllCall("GetFinalPathNameByHandle", "Ptr", lpTargetHandle, "Str", filePath, "UInt", 512, "UInt", 0)) {
				handle := String_RegexRemove(filePath, "^\\\\\?\\")
				handles.Push(handle)
			}
			DllCall("CloseHandle", "Ptr", lpTargetHandle)
		}
	}
	DllCall("CloseHandle", "Ptr", hProcess)
	
	Return handles
}


;--------------------------------------------------------------------------------
