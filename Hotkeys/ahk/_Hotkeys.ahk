;--------------------------------------------------------------------------------
; _Hotkeys.ahk
;--------------------------------------------------------------------------------
; F1                 ; Open selected file in Notepad++                          ;
;                    ;                                                          ;
; Shift+F2           ; Open BulkRenameUtility in current directory              ;
;                    ;                                                          ;
; Shift+F3           ; Open WinDirStat in current directory                     ;
;                    ;                                                          ;
; Ctrl+Shift+C       ; Open command prompt in current directory                 ;
; Ctrl+Shift+Alt+C   ; Open command prompt in current directory as Admin        ;
;                    ;                                                          ;
; Ctrl+Shift+M       ; Create new .txt document in current directory            ;
;                    ;                                                          ;
; Ctrl+Shift+P       ; Add selected file to winrar rar archive                  ;
; Ctrl+Shift+Alt+P   ; Add selected file to winrar rar archive and delete       ;
; Ctrl+Shift+I       ; Add selected file to winrar gzip archive                 ;
; Ctrl+Shift+Alt+I   ; Add selected file to winrar gzip archive and delete      ;
; Ctrl+Shift+O       ; Extract selected winrar archive                          ;
; Ctrl+Shift+Alt+O   ; Extract selected winrar archive and delete               ;
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
; Ctrl+W             ; Disables the 'Close Window' shortcut in Explorer         ;
;                    ;                                                          ;
; Ctrl+Alt+Numpad0   ; Executes CustomMacro_0.bat accessible on the system path ;
; Ctrl+Alt+Numpad1   ; Executes CustomMacro_1.bat accessible on the system path ;
; Ctrl+Alt+Numpad2   ; Executes CustomMacro_2.bat accessible on the system path ;
; Ctrl+Alt+Numpad3   ; Executes CustomMacro_3.bat accessible on the system path ;
; Ctrl+Alt+Numpad4   ; Executes CustomMacro_4.bat accessible on the system path ;
; Ctrl+Alt+Numpad5   ; Executes CustomMacro_5.bat accessible on the system path ;
; Ctrl+Alt+Numpad6   ; Executes CustomMacro_6.bat accessible on the system path ;
; Ctrl+Alt+Numpad7   ; Executes CustomMacro_7.bat accessible on the system path ;
; Ctrl+Alt+Numpad8   ; Executes CustomMacro_8.bat accessible on the system path ;
; Ctrl+Alt+Numpad9   ; Executes CustomMacro_9.bat accessible on the system path ;
;                    ;                                                          ;
; Ctrl+Alt+Numpad[.] ; Starts the Windows Snip & Sketch tool                    ;
; Ctrl+Alt+Numpad[+] ; Starts the Windows Calculator app                        ;
; Ctrl+Alt+Numpad[/] ; Starts the Windows Calendar app                          ;
; Ctrl+Alt+Numpad[*] ; Starts the Windows Mail app                              ;
; Ctrl+Alt+Numpad[-] ; Starts the Microsoft To Do app                           ;
;--------------------------------------------------------------------------------


#Requires AutoHotkey v1.1

#Persistent
#SingleInstance Force
#NoTrayIcon
#NoEnv

SetKeyDelay, 0, 50
SetBatchLines 10ms
SetTitleMatchMode RegEx


;--------------------------------------------------------------------------------


#Include EditWithNotepad++.ahk
#Include BulkRenameHere.ahk
#Include DirStatHere.ahk

#Include CommandPromptHere.ahk
#Include NewTextDocument.ahk

#Include WinrarArchiveActions.ahk

#Include StashSelection.ahk
#Include UnfolderSelection.ahk

#Include InvertSelection.ahk
#Include SelectNextFileAfterDelete.ahk

#Include DisableCloseExplorerHotkey.ahk

#Include CustomNumpadMacros.ahk
#Include LaunchWindowsApps.ahk


;--------------------------------------------------------------------------------
