;--------------------------------------------------------------------------------
; _Config.ahk
;--------------------------------------------------------------------------------


#Requires AutoHotkey v1.1

#Persistent
#SingleInstance Force
#NoTrayIcon
#NoEnv

#InstallKeybdHook
#InstallMouseHook
#UseHook Off
#InputLevel 0
#MenuMaskKey vkFF
#WinActivateForce

;#ErrorStdOut
#Warn All, Off
#Warn UseUnsetLocal, Off
#Warn UseUnsetGlobal, Off
#Warn UseEnv, Off
#Warn LocalSameAsGlobal, Off
#Warn ClassOverwrite, Off
#Warn Unreachable, Off

#HotkeyInterval 2000
#MaxHotkeysPerInterval 70
#HotkeyModifierTimeout 50
#ClipboardTimeout 1000
#KeyHistory 500

#MaxThreadsPerHotkey 1
#MaxThreadsBuffer Off
#MaxThreads 10
#MaxMem 256

SetKeyDelay, 0, 50
SetMouseDelay, 10
SetMouseDelay, -1, Play
SetDefaultMouseSpeed 2
SetStoreCapsLockMode On
SendMode Event
SendLevel 0

SetWorkingDir A_ScriptDir
FileEncoding UTF-8
StringCaseSense Off
AutoTrim On
SetRegView Default
SetFormat, IntegerFast, D
SetFormat, FloatFast, 0.6

SetWinDelay, 100
SetTitleMatchMode RegEx
DetectHiddenText On
DetectHiddenWindows Off
CoordMode, ToolTip, Screen
CoordMode, Pixel, Screen
CoordMode, Mouse, Screen
CoordMode, Caret, Screen
CoordMode, Menu, Screen

Thread, Priority, 0
Thread, NoTimers, False
Thread, Interrupt, 15, 1000

SetControlDelay, 20
SetBatchLines 10ms
ListLines Off
Critical Off


;--------------------------------------------------------------------------------
