;--------------------------------------------------------------------------------
; _Array.ahk
;--------------------------------------------------------------------------------


Array_ArrToStr(arr) {
	for i in arr {
		str .= (str = "" ? "" : "`n") . arr[i]
	}
	Return str
}


Array_StrToArr(str) {
	Return StrSplit(str, "`n")
}


;--------------------------------------------------------------------------------