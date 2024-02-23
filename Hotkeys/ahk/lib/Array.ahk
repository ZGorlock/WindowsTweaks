;--------------------------------------------------------------------------------
; Array.ahk
;--------------------------------------------------------------------------------


#Include lib\String.ahk


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


Array_FilterNotBlank(arr) {
	filtered := []
	for index, element in arr {
		if (String_IsNotBlank(element)) {
			filtered.Push(element)
		}
	}
	return filtered
}


Array_FilterContains(arr, prefix, caseSensitive := FALSE) {
	filtered := []
	for index, element in arr {
		if (String_Contains(element, prefix, caseSensitive)) {
			filtered.Push(element)
		}
	}
	return filtered
}


Array_FilterNotContains(arr, prefix, caseSensitive := FALSE) {
	filtered := []
	for index, element in arr {
		if (!String_Contains(element, prefix, caseSensitive)) {
			filtered.Push(element)
		}
	}
	return filtered
}


Array_FilterStartsWith(arr, prefix, caseSensitive := FALSE) {
	filtered := []
	for index, element in arr {
		if (String_StartsWith(element, prefix, caseSensitive)) {
			filtered.Push(element)
		}
	}
	return filtered
}


Array_FilterNotStartsWith(arr, prefix, caseSensitive := FALSE) {
	filtered := []
	for index, element in arr {
		if (!String_StartsWith(element, prefix, caseSensitive)) {
			filtered.Push(element)
		}
	}
	return filtered
}


Array_StrToArr(str) {
	return String_SplitLines(str)
}


Array_ArrToStr(arr) {
	return String_UnsplitLines(arr)
}


;--------------------------------------------------------------------------------
