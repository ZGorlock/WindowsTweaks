;--------------------------------------------------------------------------------
; Filesystem.ahk
;--------------------------------------------------------------------------------


#Include lib\String.ahk


;--------------------------------------------------------------------------------


Filesystem_FileExists(path) {
	return FileExist(path) ? TRUE : FALSE
}


Filesystem_FileAttributes(path) {
	FileGetAttrib, attributes, % path
	return attributes
}


Filesystem_IsDir(path) {
	attributes := Filesystem_FileAttributes(path)
	return String_Contains(attributes, "D")
}


Filesystem_IsFile(path) {
	attributes := Filesystem_FileAttributes(path)
	return String_IsNotEmpty(attributes) && String_NotContains(attributes, "D")
}


Filesystem_IsType(path, type) {
	if (!type) {
		return TRUE
	} else if (String_Equals(type, "D")) {
		return Filesystem_IsDir(path)
	} else if (String_Equals(type, "F")) {
		return Filesystem_IsFile(path)
	} else {
		return FALSE
	}
}


Filesystem_HasAttribute(path, attribute) {
	return String_Contains(Filesystem_FileAttributes(path), attribute)
}


Filesystem_HasAttribute_ReadOnly(path) {
	return Filesystem_HasAttribute(path, "R")
}


Filesystem_HasAttribute_Archive(path) {
	return Filesystem_HasAttribute(path, "A")
}


Filesystem_HasAttribute_System(path) {
	return Filesystem_HasAttribute(path, "S")
}


Filesystem_HasAttribute_Hidden(path) {
	return Filesystem_HasAttribute(path, "H")
}


Filesystem_HasAttribute_Normal(path) {
	return Filesystem_HasAttribute(path, "N")
}


Filesystem_HasAttribute_Directory(path) {
	return Filesystem_HasAttribute(path, "D")
}


Filesystem_HasAttribute_Offline(path) {
	return Filesystem_HasAttribute(path, "O")
}


Filesystem_HasAttribute_Compressed(path) {
	return Filesystem_HasAttribute(path, "C")
}


Filesystem_HasAttribute_Temporary(path) {
	return Filesystem_HasAttribute(path, "T")
}


Filesystem_List(path, mode := "") {
	files := []
	loop files, %path%\*, %mode%
	{
		files.Push(A_LoopFileFullPath)
	}
	return files
}


Filesystem_ListFiles(path) {
	return Filesystem_List(path, "F")
}


Filesystem_ListDirs(path) {
	return Filesystem_List(path, "D")
}


Filesystem_ListFilesAndDirs(path) {
	return Filesystem_List(path, "FD")
}


Filesystem_ListFilesRecursively(path) {
	return Filesystem_List(path, "FR")
}


Filesystem_ListDirsRecursively(path) {
	return Filesystem_List(path, "DR")
}


Filesystem_ListFilesAndDirsRecursively(path) {
	return Filesystem_List(path, "FDR")
}


Filesystem_DirIsEmpty(path) {
	return Array_IsEmpty(Filesystem_ListFilesAndDirs(path))
}


Filesystem_DirIsNotEmpty(path) {
	return !Filesystem_DirIsEmpty(path)
}


Filesystem_CreateFile(path) {
	FileAppend, , % path
}


Filesystem_CreateDir(path) {
	FileCreateDir, % path
}


Filesystem_Create(path) {
	if (path ~= "^.*\.[^\.\s\\/]+$") {
		Filesystem_CreateFile(path)
	} else {
		Filesystem_CreateDir(path)
	}
}


Filesystem_DeleteFile(path) {
	FileDelete, % path
}


Filesystem_DeleteDir(path) {
	FileRemoveDir, % path, TRUE
}


Filesystem_Delete(path) {
	if (Filesystem_IsDir(path)) {
		Filesystem_DeleteDir(path)
	} else if (Filesystem_IsFile(path)) {
		Filesystem_DeleteFile(path)
	}
}


Filesystem_RecycleFile(path) {
	FileRecycle, % path
}


Filesystem_RecycleDir(path) {
	FileRecycle, % path
}


Filesystem_Recycle(path) {
	if (Filesystem_IsDir(path)) {
		Filesystem_RecycleDir(path)
	} else if (Filesystem_IsFile(path)) {
		Filesystem_RecycleFile(path)
	}
}


Filesystem_CopyFile(path, dest, overwrite := FALSE) {
	FileCopy, % path, % dest, % overwrite
}


Filesystem_CopyDir(path, dest, overwrite := FALSE) {
	SplitPath path, name, dir, ext, nameNoExt, drive
	FileCopyDir, % path, % Filesystem_Path(dest, name), % overwrite
}


Filesystem_Copy(path, dest, overwrite := FALSE) {
	if (Filesystem_IsDir(path)) {
		Filesystem_CopyDir(path, dest, overwrite)
	} else if (Filesystem_IsFile(path)) {
		Filesystem_CopyFile(path, dest, overwrite)
	}
}


Filesystem_MoveFile(path, dest, overwrite := FALSE) {
	FileMove, % path, % dest, % overwrite
}


Filesystem_MoveDir(path, dest, overwrite := FALSE) {
	SplitPath path, name, dir, ext, nameNoExt, drive
	FileMoveDir, % path, % Filesystem_Path(dest, name), % overwrite
}


Filesystem_Move(path, dest, overwrite := FALSE) {
	if (Filesystem_IsDir(path)) {
		Filesystem_MoveDir(path, dest, overwrite)
	} else if (Filesystem_IsFile(path)) {
		Filesystem_MoveFile(path, dest, overwrite)
	}
}


Filesystem_Path(parts*) {
	path := String_Join("\", parts)
	path := String_RegexReplace(path, "[\\/]+", "\")
	path := String_RegexRemove(path, "^(?:\\|\?|\w{2,}:)+")
	path := String_RegexRemove(path, "\\$")
	return path
}


Filesystem_DirPath(parts*) {
	return Filesystem_Path(parts) . "\"
}


Filesystem_GetUnusedFilename(path, name, ext) {
	file := Filesystem_Path(path, (name . "." . ext))
	while (FileExist(file)) {
		file := Filesystem_Path(path, (name . " (" . (A_Index + 1) . ")." . ext))
	}
	return file
}


;--------------------------------------------------------------------------------
