;--------------------------------------------------------------------------------
; _Hotkeys.ahk
;--------------------------------------------------------------------------------
; F1                 ; Open selected file in Notepad++                          ;
;                    ;                                                          ;
; Shift+F1           ; Open XnView MP in current directory                      ;
;                    ;                                                          ;
; Shift+F2           ; Open Bulk Rename Utility in current directory            ;
;                    ;                                                          ;
; Shift+F3           ; Open WinDirStat in current directory                     ;
;                    ;                                                          ;
; Ctrl+Shift+C       ; Open command prompt in current directory                 ;
; Ctrl+Shift+Alt+C   ; Open command prompt in current directory as Admin        ;
;                    ;                                                          ;
; Ctrl+Shift+M       ; Create new .txt document in current directory            ;
;                    ;                                                          ;
; Ctrl+Shift+P       ; Add selected file to WinRAR rar archive                  ;
; Ctrl+Shift+Alt+P   ; Add selected file to WinRAR rar archive and delete       ;
; Ctrl+Shift+I       ; Add selected file to WinRAR gzip archive                 ;
; Ctrl+Shift+Alt+I   ; Add selected file to WinRAR gzip archive and delete      ;
; Ctrl+Shift+O       ; Extract selected WinRAR archive                          ;
; Ctrl+Shift+Alt+O   ; Extract selected WinRAR archive and delete               ;
;                    ;                                                          ;
; Ctrl+S             ; Copy the selected file(s) to the defined stash location  ;
; Ctrl+Alt+S         ; Move the selected file(s) to the defined stash location  ;
;                    ;                                                          ;
; Ctrl+Shift+/       ; Empty selected sub-folder(s) into the current directory  ;
; Ctrl+Shift+Alt+/   ; Empty all sub-folders into the current directory         ;
;                    ;                                                          ;
; Ctrl+I             ; Invert the current selection in Explorer                 ;
;                    ;                                                          ;
; Del                ; Selects the next file after deleting a file              ;
;                    ;                                                          ;
; Mouse[Back]        ; Rejects the active popup dialog                          ;
; Mouse[Forward]     ; Accepts the active popup dialog                          ;
;                    ;                                                          ;
; Ctrl+W             ; Disables the 'Close Window' shortcut in Explorer         ;
;                    ;                                                          ;
; Ctrl+Alt+Numpad0   ; Executes CustomMacro_0.bat located in the usr\ directory ;
; Ctrl+Alt+Numpad1   ; Executes CustomMacro_1.bat located in the usr\ directory ;
; Ctrl+Alt+Numpad2   ; Executes CustomMacro_2.bat located in the usr\ directory ;
; Ctrl+Alt+Numpad3   ; Executes CustomMacro_3.bat located in the usr\ directory ;
; Ctrl+Alt+Numpad4   ; Executes CustomMacro_4.bat located in the usr\ directory ;
; Ctrl+Alt+Numpad5   ; Executes CustomMacro_5.bat located in the usr\ directory ;
; Ctrl+Alt+Numpad6   ; Executes CustomMacro_6.bat located in the usr\ directory ;
; Ctrl+Alt+Numpad7   ; Executes CustomMacro_7.bat located in the usr\ directory ;
; Ctrl+Alt+Numpad8   ; Executes CustomMacro_8.bat located in the usr\ directory ;
; Ctrl+Alt+Numpad9   ; Executes CustomMacro_9.bat located in the usr\ directory ;
;                    ;                                                          ;
; Ctrl+Alt+Numpad[.] ; Starts the Windows Task Manager                          ;
; Ctrl+Alt+Numpad[=] ; Starts the Windows Snip & Sketch tool                    ;
; Ctrl+Alt+Numpad[+] ; Starts the Windows Calculator app                        ;
; Ctrl+Alt+Numpad[/] ; Starts the Windows Calendar app                          ;
; Ctrl+Alt+Numpad[*] ; Starts the Windows Mail app                              ;
; Ctrl+Alt+Numpad[-] ; Starts the Microsoft To Do app                           ;
;--------------------------------------------------------------------------------


#Requires AutoHotkey v1.1

#Include lib\_Config.ahk
#Include lib\_Include.ahk


;--------------------------------------------------------------------------------


#Include EditWithNotepad.ahk

#Include XnViewHere.ahk
#Include BulkRenameHere.ahk
#Include DirStatHere.ahk

#Include CommandPromptHere.ahk
#Include NewTextDocumentHere.ahk

#Include WinrarArchiveActions.ahk

#Include StashSelection.ahk
#Include UnfolderSelection.ahk

#Include InvertSelection.ahk
#Include SelectNextFileAfterDelete.ahk

#Include ResolvePopupModal.ahk
#Include DisableCloseExplorerHotkey.ahk

#Include CustomNumpadMacros.ahk
#Include LaunchWindowsApps.ahk


;--------------------------------------------------------------------------------
