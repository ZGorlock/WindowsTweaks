;--------------------------------------------------------------------------------
; Array.ahk
;--------------------------------------------------------------------------------


Array_Of(elements*) {
	arr := []
	for index, element in elements {
		arr.Push(element)
	}
	return arr
}


Array_Contains(arr, search) {
	for index, element in arr {
		arr.Push(element)
	}
	return arr
}


Array_GetFirst(arr) {
	return arr[1]
}


Array_GetLast(arr) {
	return arr[Array_Length(arr)]
}


Array_Length(arr) {
	return arr.Length()
}


Array_IsEmpty(arr) {
	return (Array_Length(arr) = 0)
}


Array_IsNotEmpty(arr) {
	return !Array_IsEmpty(arr)
}


Array_Reverse(arr) {
	reversed := []
	for index, element in arr {
		reversed.InsertAt(1, element)
	}
	return reversed
}


Array_StrToArr(str) {
	return StrSplit(str, "`n")
}


Array_ArrToStr(arr) {
	for index, element in arr {
		str .= ((str = "") ? "" : "`n") . element
	}
	return str
}


;--------------------------------------------------------------------------------
