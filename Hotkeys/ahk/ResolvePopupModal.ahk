;--------------------------------------------------------------------------------
; ResolvePopupModal.ahk
;--------------------------------------------------------------------------------
; Mouse[Back]        ; Rejects the active popup dialog                          ;
; Mouse[Forward]     ; Accepts the active popup dialog                          ;
;--------------------------------------------------------------------------------


#Include lib\_Config.ahk

#Include lib\Desktop.ahk
#Include lib\String.ahk


;--------------------------------------------------------------------------------


ResolvePopupModal_IsActive() {
	return String_Equals(Desktop_GetActiveWindowClass(), "#32770")
}


;--------------------------------------------------------------------------------


#If ResolvePopupModal_IsActive()


XButton1::
RejectPopupModal:
{
	Send {Escape}
	return
}


XButton2::
AcceptPopupModal:
{
	Send {Enter}
	return
}


#If


;--------------------------------------------------------------------------------
