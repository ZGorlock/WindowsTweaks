;--------------------------------------------------------------------------------
; Filesystem.ahk
;--------------------------------------------------------------------------------


Filesystem_IsDir(path) {
	Return InStr(FileExist(path), "D")
}


Filesystem_IsFile(path) {
	Return FileExist(path) ~= "^[^D]+$"
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


Filesystem_CopyFile(path, dest, overwrite:=0) {
	FileCopy, % path, % dest, % overwrite
}


Filesystem_CopyDir(path, dest, overwrite:=0) {
	SplitPath path, name, dir, ext, nameNoExt, drive
	FileCopyDir, % path, % (dest . "\" . name), % overwrite
}


Filesystem_Copy(path, dest, overwrite:=0) {
	if Filesystem_IsDir(path) {
		Filesystem_CopyDir(path, dest, overwrite)
	} else if Filesystem_IsFile(path) {
		Filesystem_CopyFile(path, dest, overwrite)
	}
}


Filesystem_MoveFile(path, dest, overwrite:=0) {
	FileMove, % path, % dest, % overwrite
}


Filesystem_MoveDir(path, dest, overwrite:=0) {
	SplitPath path, name, dir, ext, nameNoExt, drive
	FileMoveDir, % path, % (dest . "\" . name), % overwrite
}


Filesystem_Move(path, dest, overwrite:=0) {
	if Filesystem_IsDir(path) {
		Filesystem_MoveDir(path, dest, overwrite)
	} else if Filesystem_IsFile(path) {
		Filesystem_MoveFile(path, dest, overwrite)
	}
}


;--------------------------------------------------------------------------------
