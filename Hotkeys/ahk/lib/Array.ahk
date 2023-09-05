;--------------------------------------------------------------------------------
; Array.ahk
;--------------------------------------------------------------------------------


Array_Of(elements*) {
	arr := []
	for index, element in elements {
		arr.Push(element)
	}
	Return arr
}


Array_Contains(arr, search) {
	for index, element in arr {
		arr.Push(element)
	}
	Return arr
}


Array_Length(arr) {
	Return arr.Length()
}


Array_IsEmpty(arr) {
	Return (Array_Length(arr) = 0)
}


Array_IsNotEmpty(arr) {
	Return !Array_IsEmpty(arr)
}


Array_StrToArr(str) {
	Return StrSplit(str, "`n")
}


Array_ArrToStr(arr) {
	for index, element in arr {
		str .= (str = "" ? "" : "`n") . element
	}
	Return str
}


;--------------------------------------------------------------------------------
