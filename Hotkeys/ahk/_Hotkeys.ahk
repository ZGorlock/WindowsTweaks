;--------------------------------------------------------------------------------
; _Hotkeys.ahk
;--------------------------------------------------------------------------------
; F1                 ; Open selected file in Notepad++                          ;
;                    ;                                                          ;
; Shift+F2           ; Open BulkRenameUtility in current directory              ;
;                    ;                                                          ;
; Shift+F3           ; Open WinDirStat in current directory                     ;
;                    ;                                                          ;
; ~Ctrl+Shift+C      ; Open command prompt in current directory                 ;
; ~Ctrl+Shift+Alt+C  ; Open command prompt in current directory as Admin        ;
;                    ;                                                          ;
; ~Ctrl+Shift+M      ; Create new .txt document in current directory            ;
;                    ;                                                          ;
; ~Ctrl+Shift+P      ; Add selected file to winrar rar archive                  ;
; ~Ctrl+Shift+Alt+P  ; Add selected file to winrar rar archive and delete       ;
; ~Ctrl+Shift+I      ; Add selected file to winrar gzip archive                 ;
; ~Ctrl+Shift+Alt+I  ; Add selected file to winrar gzip archive and delete      ;
; ~Ctrl+Shift+O      ; Extract selected winrar archive                          ;
; ~Ctrl+Shift+Alt+O  ; Extract selected winrar archive and delete (NOT WORKING) ;
;                    ;                                                          ;
; ~Ctrl+I            ; Invert the current selection in Explorer                 ;
;                    ;                                                          ;
; ~Ctrl+Q            ; Copy the selected file(s) to the defined stash location  ;
; ~Ctrl+Shift+Q      ; Move the selected file(s) to the defined stash location  ;
;                    ;                                                          ;
; ~Del               ; Selects the next file after deleting a file              ;
;                    ;                                                          ;
; $Ctrl+W            ; Disables the 'Close Window' shortcut in Explorer         ;
;                    ;                                                          ;
; ~Ctrl+Alt+Numpad#  ; Runs the custom macro defined for Numpad0, ..., Numpad9  ;
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

#Include InvertSelection.ahk
#Include StashSelection.ahk
#Include SelectNextFileAfterDelete.ahk

#Include DisableCloseExplorerHotkey.ahk

#Include CustomNumpadMacros.ahk


;--------------------------------------------------------------------------------