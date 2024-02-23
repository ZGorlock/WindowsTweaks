;--------------------------------------------------------------------------------
; String.ahk
;--------------------------------------------------------------------------------


String_Length(str) {
	return StrLen(str)
}


String_IsEmpty(str) {
	return !String_Length(str)
}


String_IsNotEmpty(str) {
	return !String_IsEmpty(str)
}


String_IsBlank(str) {
	return String_IsEmpty(String_Trim(str))
}


String_IsNotBlank(str) {
	return !String_IsBlank(str)
}


String_SubStr(str, start, len := 0) {
	return SubStr(str, start, len)
}


String_Fill(len, fill := " ") {
	VarSetCapacity(newStr, len, Asc(fill))
	return newStr
}


String_Join(sep, tokens*) {
	for index, token in tokens {
		substr := IsObject(token) ? String_Join(sep, token*) : token
		str .= (String_IsNotEmpty(str) ? sep : "") . substr
	}
	return str
}


String_Concat(tokens*) {
	return String_Join("", tokens)
}


String_Wrap(sep, prefix, suffix, tokens*) {
	return prefix . String_Join(sep, tokens) . suffix
}


String_Split(str, delim) {
	return StrSplit(str, delim)
}


String_SplitLines(str) {
	str := String_Replace(str, "`r`n", "`n")
	return String_Split(str, "`n")
}


String_UnsplitLines(lines) {
	return String_Join("`n", lines)
}


String_Append(str, suffix) {
	return str . suffix
}


String_Prepend(str, prefix) {
	return prefix . str
}


String_Trim(str) {
	return Trim(str)
}


String_LTrim(str) {
	return LTrim(str)
}


String_RTrim(str) {
	return RTrim(str)
}


String_Pad(str, len, pad := " ") {
	padding := String_Fill(len, pad)
	return padding . str . padding
}


String_LPad(str, len, pad := " ") {
	padding := String_Fill(len, pad)
	return padding . str
}


String_RPad(str, len, pad := " ") {
	padding := String_Fill(len, pad)
	return str . padding
}


String_LSnip(str, len) {
	return String_SubStr(str, 1, len)
}


String_RSnip(str, len) {
	return String_SubStr(str, (String_Length(str) - len), len)
}


String_LShear(str, len) {
	return String_SubStr(str, (len + 1))
}


String_RShear(str, len) {
	return String_SubStr(str, 1, (String_Length(str) - len))
}


String_ToLowercase(str) {
	StringLower, newStr, str
	return newStr
}


String_ToUppercase(str) {
	StringUpper, newStr, str
	return newStr
}


String_ToTitlecase(str) {
	StringUpper, newStr, str, T
	return newStr
}


String_IndexOf(str, search, caseSensitive := FALSE) {
	return InStr(str, search, caseSensitive)
}


String_IndexOf_CaseSensitive(str, search) {
	return String_IndexOf(str, search, TRUE)
}


String_Equals(str, test, caseSensitive := FALSE) {
	return caseSensitive ? (str == test) : (str = test)
}


String_Equals_CaseSensitive(str, test) {
	return String_Equals(str, test, TRUE)
}


String_NotEquals(str, test, caseSensitive := FALSE) {
	return caseSensitive ? (str !== test) : (str != test)
}


String_NotEquals_CaseSensitive(str, test) {
	return String_NotEquals(str, test, TRUE)
}


String_Contains(str, search, caseSensitive := FALSE) {
	return String_IndexOf(str, search, caseSensitive) ? TRUE : FALSE
}


String_Contains_CaseSensitive(str, search) {
	return String_Contains(str, search, TRUE)
}


String_NotContains(str, search, caseSensitive := FALSE) {
	return !String_Contains(str, search, caseSensitive)
}


String_NotContains_CaseSensitive(str, search) {
	return String_NotContains(str, search, TRUE)
}


String_StartsWith(str, prefix, caseSensitive := FALSE) {
	return String_Equals(String_LSnip(str, String_Length(prefix)), prefix, caseSensitive)
}


String_StartsWith_CaseSensitive(str, prefix) {
	return String_StartsWith(str, prefix, TRUE)
}


String_NotStartsWith(str, prefix, caseSensitive := FALSE) {
	return !String_StartsWith(str, prefix, caseSensitive)
}


String_NotStartsWith_CaseSensitive(str, prefix) {
	return String_NotStartsWith(str, prefix, TRUE)
}


String_EndsWith(str, suffix, caseSensitive := FALSE) {
	return String_Equals(String_RSnip(str, String_Length(suffix)), suffix, caseSensitive)
}


String_EndsWith_CaseSensitive(str, suffix) {
	return String_EndsWith(str, suffix, TRUE)
}


String_NotEndsWith(str, suffix, caseSensitive := FALSE) {
	return !String_EndsWith(str, suffix, caseSensitive)
}


String_NotEndsWith_CaseSensitive(str, suffix) {
	return String_NotEndsWith(str, suffix, TRUE)
}


String_Replace(str, search, replace, caseSensitive := FALSE) {
	if (caseSensitive) {
		caseSense := A_StringCaseSense
		StringCaseSense On
	}
	result := StrReplace(str, search, replace)
	if (caseSensitive) {
		StringCaseSense % caseSense
	}
	return result
}


String_Replace_CaseSensitive(str, search, replace) {
	return String_Replace(str, search, replace, TRUE)
}


String_Remove(str, remove, caseSensitive := FALSE) {
	return String_Replace(str, remove, "", caseSensitive)
}


String_Remove_CaseSensitive(str, remove) {
	return String_Remove(str, remove, TRUE)
}

String_RegexMatches(str, pattern, caseSensitive := FALSE) {
	regex := (caseSensitive ? "-i)" : "i)") . "^(?:" . pattern . ")$"
	return RegExMatch(str, regex)
}


String_RegexMatches_CaseSensitive(str, pattern) {
	return String_RegexMatches(str, pattern, TRUE)
}


String_NotRegexMatches(str, pattern, caseSensitive := FALSE) {
	return !String_RegexMatches(str, pattern, caseSensitive)
}


String_NotRegexMatches_CaseSensitive(str, pattern) {
	return String_NotRegexMatches(str, pattern, TRUE)
}


String_RegexContains(str, pattern, caseSensitive := FALSE) {
	return String_RegexMatches(str, (".*" . pattern . ".*"), caseSensitive)
}


String_RegexContains_CaseSensitive(str, pattern) {
	return String_RegexContains(str, pattern, TRUE)
}


String_NotRegexContains(str, pattern, caseSensitive := FALSE) {
	return !String_RegexContains(str, pattern, caseSensitive)
}


String_NotRegexContains_CaseSensitive(str, pattern) {
	return String_NotRegexContains(str, pattern, TRUE)
}


String_RegexStartsWith(str, pattern, caseSensitive := FALSE) {
	return String_RegexMatches(str, (pattern . ".*"), caseSensitive)
}


String_RegexStartsWith_CaseSensitive(str, pattern) {
	return String_RegexStartsWith(str, pattern, TRUE)
}


String_NotRegexStartsWith(str, pattern, caseSensitive := FALSE) {
	return !String_RegexStartsWith(str, pattern, caseSensitive)
}


String_NotRegexStartsWith_CaseSensitive(str, pattern) {
	return String_NotRegexStartsWith(str, pattern, TRUE)
}


String_RegexEndsWith(str, pattern, caseSensitive := FALSE) {
	return String_RegexMatches(str, (".*" . pattern), caseSensitive)
}


String_RegexEndsWith_CaseSensitive(str, pattern) {
	return String_RegexEndsWith(str, pattern, TRUE)
}


String_NotRegexEndsWith(str, pattern, caseSensitive := FALSE) {
	return !String_RegexEndsWith(str, pattern, caseSensitive)
}


String_NotRegexEndsWith_CaseSensitive(str, pattern) {
	return String_NotRegexEndsWith(str, pattern, TRUE)
}


String_RegexReplace(str, pattern, replace, caseSensitive := FALSE) {
	return RegExReplace(str, ((caseSensitive ? "-i)" : "i)") . pattern), replace)
}


String_RegexReplace_CaseSensitive(str, pattern, replace) {
	return String_RegexReplace(str, pattern, replace, TRUE)
}


String_RegexRemove(str, pattern, caseSensitive := FALSE) {
	return String_RegexReplace(str, pattern, "", caseSensitive)
}


String_RegexRemove_CaseSensitive(str, pattern) {
	return String_RegexRemove(str, pattern, TRUE)
}


;--------------------------------------------------------------------------------
