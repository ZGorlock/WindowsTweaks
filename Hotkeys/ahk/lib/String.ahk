;--------------------------------------------------------------------------------
; String.ahk
;--------------------------------------------------------------------------------


String_Length(str) {
	Return StrLen(str)
}


String_IsEmpty(str) {
	Return !String_Length(str)
}


String_IsNotEmpty(str) {
	Return !String_IsEmpty(str)
}


String_IsBlank(str) {
	Return String_IsEmpty(String_Trim(str))
}


String_IsNotBlank(str) {
	Return !String_IsBlank(str)
}


String_SubStr(str, start, len:=0) {
	Return SubStr(str, start, len)
}


String_Fill(len, fill:=" ") {
	VarSetCapacity(newStr, len, Asc(fill))
	Return newStr
}


String_Join(sep, parts*) {
	for index, part in parts {
		str .= (String_IsEmpty(str) ? sep : "") . part
	}
	Return str
}


String_Concat(parts*) {
	Return String_Join("", parts)
}


String_Wrap(sep, prefix, suffix, parts*) {
	Return (prefix . String_Join(sep, parts) . suffix)
}


String_Split(str, delim) {
	Return StrSplit(str, delim)
}


String_SplitLines(str) {
	str := String_Replace(str, "`r`n", "`n")
	Return String_Split(str, "`n")
}


String_UnsplitLines(lines) {
	str := String_Replace(str, "`r`n", "`n")
	Return String_Join("`n", str)
}


String_Append(str, suffix) {
	Return (str . suffix)
}


String_Prepend(str, prefix) {
	Return (prefix . str)
}


String_Trim(str) {
	Return Trim(str)
}


String_LTrim(str) {
	Return LTrim(str)
}


String_RTrim(str) {
	Return RTrim(str)
}


String_Pad(str, len, pad:=" ") {
	padding := String_Fill(len, pad)
	Return padding . str . padding
}


String_LPad(str, len, pad:=" ") {
	padding := String_Fill(len, pad)
	Return padding . str
}


String_RPad(str, len, pad:=" ") {
	padding := String_Fill(len, pad)
	Return str . padding
}


String_LSnip(str, len) {
	Return String_SubStr(str, 1, len)
}


String_RSnip(str, len) {
	Return String_SubStr(str, (String_Length(str) - len), len)
}


String_LShear(str, len) {
	Return String_SubStr(str, (len + 1))
}


String_RShear(str, len) {
	Return String_SubStr(str, 1, (String_Length(str) - len))
}


String_ToLowercase(str) {
	StringLower, newStr, str
	Return newStr
}


String_ToUppercase(str) {
	StringUpper, newStr, str
	Return newStr
}


String_ToTitlecase(str) {
	StringUpper, newStr, str, T
	Return newStr
}


String_IndexOf(str, search, caseSensative:=FALSE) {
	Return InStr(str, search, caseSensative)
}


String_IndexOf_CaseSensative(str, search) {
	Return String_IndexOf(str, search, TRUE)
}


String_Equals(str, test, caseSensative:=FALSE) {
	Return caseSensative ? (str == test) : (str = test)
}


String_Equals_CaseSensative(str, test) {
	Return String_Equals(str, test, TRUE)
}


String_NotEquals(str, test, caseSensative:=FALSE) {
	Return caseSensative ? (str !== test) : (str != test)
}


String_NotEquals_CaseSensative(str, test) {
	Return String_NotEquals(str, test, TRUE)
}


String_Contains(str, search, caseSensative:=FALSE) {
	Return String_IndexOf(str, search, caseSensative) ? TRUE : FALSE
}


String_Contains_CaseSensative(str, search) {
	Return String_Contains(str, search, TRUE)
}


String_NotContains(str, search, caseSensative:=FALSE) {
	Return !String_Contains(str, search, caseSensative)
}


String_NotContains_CaseSensative(str, search) {
	Return String_NotContains(str, search, TRUE)
}


String_StartsWith(str, prefix, caseSensative:=FALSE) {
	Return String_Equals(String_LSnip(str, String_Length(prefix)), prefix, caseSensative)
}


String_StartsWith_CaseSensative(str, prefix) {
	Return String_StartsWith(str, prefix, TRUE)
}


String_NotStartsWith(str, prefix, caseSensative:=FALSE) {
	Return !String_StartsWith(str, prefix, caseSensative)
}


String_NotStartsWith_CaseSensative(str, prefix) {
	Return String_NotStartsWith(str, prefix, TRUE)
}


String_EndsWith(str, suffix, caseSensative:=FALSE) {
	Return String_Equals(String_RSnip(str, String_Length(suffix)), suffix, caseSensative)
}


String_EndsWith_CaseSensative(str, suffix) {
	Return String_EndsWith(str, suffix, TRUE)
}


String_NotEndsWith(str, suffix, caseSensative:=FALSE) {
	Return !String_EndsWith(str, suffix, caseSensative)
}


String_NotEndsWith_CaseSensative(str, suffix) {
	Return String_NotEndsWith(str, suffix, TRUE)
}


String_Replace(str, search, replace, caseSensative:=FALSE) {
	if (caseSensative) {
		StringCaseSense On
	}
	Return StrReplace(str, search, replace)
}


String_Replace_CaseSensative(str, search, replace) {
	Return String_Replace(str, search, replace, TRUE)
}


String_Remove(str, remove, caseSensative:=FALSE) {
	Return String_Replace(str, remove, "", caseSensative)
}


String_Remove_CaseSensative(str, remove) {
	Return String_Remove(str, remove, TRUE)
}

String_RegexMatches(str, pattern, caseSensative:=FALSE) {
	regex := (caseSensative ? "-i)" : "i)") . "^(?:" . pattern . ")$"
	Return RegExMatch(str, regex)
}


String_RegexMatches_CaseSensative(str, pattern) {
	Return String_RegexMatches(str, pattern, TRUE)
}


String_NotRegexMatches(str, pattern, caseSensative:=FALSE) {
	Return !String_RegexMatches(str, pattern, caseSensative)
}


String_NotRegexMatches_CaseSensative(str, pattern) {
	Return String_NotRegexMatches(str, pattern, TRUE)
}


String_RegexContains(str, pattern, caseSensative:=FALSE) {
	Return String_RegexMatches(str, (".*" . pattern . ".*"), caseSensative)
}


String_RegexContains_CaseSensative(str, pattern) {
	Return String_RegexContains(str, pattern, TRUE)
}


String_NotRegexContains(str, pattern, caseSensative:=FALSE) {
	Return !String_RegexContains(str, pattern, caseSensative)
}


String_NotRegexContains_CaseSensative(str, pattern) {
	Return String_NotRegexContains(str, pattern, TRUE)
}


String_RegexStartsWith(str, pattern, caseSensative:=FALSE) {
	Return String_RegexMatches(str, (pattern . ".*"), caseSensative)
}


String_RegexStartsWith_CaseSensative(str, pattern) {
	Return String_RegexStartsWith(str, pattern, TRUE)
}


String_NotRegexStartsWith(str, pattern, caseSensative:=FALSE) {
	Return !String_RegexStartsWith(str, pattern, caseSensative)
}


String_NotRegexStartsWith_CaseSensative(str, pattern) {
	Return String_NotRegexStartsWith(str, pattern, TRUE)
}


String_RegexEndsWith(str, pattern, caseSensative:=FALSE) {
	Return String_RegexMatches(str, (".*" . pattern), caseSensative)
}


String_RegexEndsWith_CaseSensative(str, pattern) {
	Return String_RegexEndsWith(str, pattern, TRUE)
}


String_NotRegexEndsWith(str, pattern, caseSensative:=FALSE) {
	Return !String_RegexEndsWith(str, pattern, caseSensative)
}


String_NotRegexEndsWith_CaseSensative(str, pattern) {
	Return String_NotRegexEndsWith(str, pattern, TRUE)
}


String_RegexReplace(str, pattern, replace, caseSensative:=FALSE) {
	Return RegExReplace(str, ((caseSensative ? "-i)" : "i)") . pattern), replace)
}


String_RegexReplace_CaseSensative(str, pattern, replace) {
	Return String_RegexReplace(str, pattern, replace, TRUE)
}


String_RegexRemove(str, pattern, caseSensative:=FALSE) {
	Return String_RegexReplace(str, pattern, "", caseSensative)
}


String_RegexRemove_CaseSensative(str, pattern) {
	Return String_RegexRemove(str, pattern, TRUE)
}


;--------------------------------------------------------------------------------
