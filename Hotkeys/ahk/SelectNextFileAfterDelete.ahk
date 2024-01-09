;--------------------------------------------------------------------------------
; SelectNextFileAfterDelete.ahk
;--------------------------------------------------------------------------------
; Del                ; Selects the next file after deleting a file              ;
;--------------------------------------------------------------------------------


#Include lib\_Config.ahk

#Include lib\Explorer.ahk


;--------------------------------------------------------------------------------


SelectNextFileAfterDelete_IsActive() {
	return Explorer_IsActive()
}


;--------------------------------------------------------------------------------


#If SelectNextFileAfterDelete_IsActive()


~Del::
SelectNextFileAfterDelete:
{
	if (!Explorer_IsEnteringText()) {
		KeyWait Del
		Send {Space}
	}
	return
}


#If


;--------------------------------------------------------------------------------
