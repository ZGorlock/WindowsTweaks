;--------------------------------------------------------------------------------
; BulkRenameHere.ahk
;--------------------------------------------------------------------------------
; Shift+F2           ; Open Bulk Rename Utility in current directory            ;
;--------------------------------------------------------------------------------


#Include lib\_Config.ahk

#Include lib\Explorer.ahk


;--------------------------------------------------------------------------------


BulkRenameHere_IsActive() {
	return Explorer_IsActive()
}


BulkRenameHere_BulkRenameUtilityExe() {
	return "C:\Program Files\Bulk Rename Utility\Bulk Rename Utility.exe"
}


;--------------------------------------------------------------------------------


#If BulkRenameHere_IsActive()


+F2::
BulkRenameHere:
{
	activePath := Explorer_GetActivePath()
	if (activePath) {
		
		exe := BulkRenameHere_BulkRenameUtilityExe()
		try {
			Run "%exe%" "%activePath%"
		}
	}
	return
}


#If


;--------------------------------------------------------------------------------
