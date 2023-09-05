;--------------------------------------------------------------------------------
; Filesystem.ahk
;--------------------------------------------------------------------------------


#Include lib\String.ahk


Filesystem_FileExists(path) {
	Return FileExist(path) ? TRUE : FALSE
}


Filesystem_FileAttributes(path) {
	FileGetAttrib, attributes, % path
	Return attributes
}


Filesystem_IsDir(path) {
	attributes := Filesystem_FileAttributes(path)
	Return String_Contains(attributes, "D")
}


Filesystem_IsFile(path) {
	attributes := Filesystem_FileAttributes(path)
	Return String_IsNotEmpty(attributes) && String_NotContains(attributes, "D")
}


Filesystem_IsType(path, type) {
	if not type {
		Return TRUE
	} else if String_Equals(type, "D") {
		Return Filesystem_IsDir(path)
	} else if String_Equals(type, "F") {
		Return Filesystem_IsFile(path)
	} else {
		Return FALSE
	}
}


Filesystem_HasAttribute(path, attribute) {
	Return String_Contains(Filesystem_FileAttributes(path), attribute)
}


Filesystem_HasAttribute_ReadOnly(path) {
	Return Filesystem_HasAttribute(path, "R")
}


Filesystem_HasAttribute_Archive(path) {
	Return Filesystem_HasAttribute(path, "A")
}


Filesystem_HasAttribute_System(path) {
	Return Filesystem_HasAttribute(path, "S")
}


Filesystem_HasAttribute_Hidden(path) {
	Return Filesystem_HasAttribute(path, "H")
}


Filesystem_HasAttribute_Normal(path) {
	Return Filesystem_HasAttribute(path, "N")
}


Filesystem_HasAttribute_Directory(path) {
	Return Filesystem_HasAttribute(path, "D")
}


Filesystem_HasAttribute_Offline(path) {
	Return Filesystem_HasAttribute(path, "O")
}


Filesystem_HasAttribute_Compressed(path) {
	Return Filesystem_HasAttribute(path, "C")
}


Filesystem_HasAttribute_Temporary(path) {
	Return Filesystem_HasAttribute(path, "T")
}


Filesystem_List(path, mode:="") {
	files := []
	Loop, Files, %path%\*, %mode%
	{
		files.Push(A_LoopFileFullPath)
	}
	Return files
}


Filesystem_ListFiles(path) {
	Return Filesystem_List(path, "F")
}


Filesystem_ListDirs(path) {
	Return Filesystem_List(path, "D")
}


Filesystem_ListFilesAndDirs(path) {
	Return Filesystem_List(path, "FD")
}


Filesystem_ListFilesRecursively(path) {
	Return Filesystem_List(path, "FR")
}


Filesystem_ListDirsRecursively(path) {
	Return Filesystem_List(path, "DR")
}


Filesystem_ListFilesAndDirsRecursively(path) {
	Return Filesystem_List(path, "FDR")
}


Filesystem_DirIsEmpty(path) {
	Return Array_IsEmpty(Filesystem_ListFilesAndDirs(path))
}


Filesystem_DirIsNotEmpty(path) {
	Return !Filesystem_DirIsEmpty(path)
}


Filesystem_CreateFile(path) {
	FileAppend, , % path
}


Filesystem_CreateDir(path) {
	FileCreateDir, % path
}


Filesystem_Create(path) {
	if path ~= "^.*\.[^\.\s\\/]+$" {
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
	if Filesystem_IsDir(path) {
		Filesystem_DeleteDir(path)
	} else if Filesystem_IsFile(path) {
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
	if Filesystem_IsDir(path) {
		Filesystem_RecycleDir(path)
	} else if Filesystem_IsFile(path) {
		Filesystem_RecycleFile(path)
	}
}


Filesystem_CopyFile(path, dest, overwrite:=FALSE) {
	FileCopy, % path, % dest, % overwrite
}


Filesystem_CopyDir(path, dest, overwrite:=FALSE) {
	SplitPath path, name, dir, ext, nameNoExt, drive
	FileCopyDir, % path, % (dest . "\" . name), % overwrite
}


Filesystem_Copy(path, dest, overwrite:=FALSE) {
	if Filesystem_IsDir(path) {
		Filesystem_CopyDir(path, dest, overwrite)
	} else if Filesystem_IsFile(path) {
		Filesystem_CopyFile(path, dest, overwrite)
	}
}


Filesystem_MoveFile(path, dest, overwrite:=FALSE) {
	FileMove, % path, % dest, % overwrite
}


Filesystem_MoveDir(path, dest, overwrite:=FALSE) {
	SplitPath path, name, dir, ext, nameNoExt, drive
	FileMoveDir, % path, % (dest . "\" . name), % overwrite
}


Filesystem_Move(path, dest, overwrite:=FALSE) {
	if Filesystem_IsDir(path) {
		Filesystem_MoveDir(path, dest, overwrite)
	} else if Filesystem_IsFile(path) {
		Filesystem_MoveFile(path, dest, overwrite)
	}
}


Filesystem_GetUnusedFilename(path, name, ext) {
	file := path . "\" . name . "." . ext
	while FileExist(file) {
		file := path . "\" . name . " (" . (A_Index + 1) . ")." . ext
	}
	Return file
}


;--------------------------------------------------------------------------------
