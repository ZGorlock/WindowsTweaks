@echo off
setlocal

set dir=%1
set pwd=%cd%

set loc=%dir%

if /i '%dir%'=='~'              (if not exist "%pwd%\~"              (set "loc=%UserProfile%"))
if /i '%dir%'=='home'           (if not exist "%pwd%\home"           (set "loc=%UserProfile%"))
if /i '%dir%'=='homedir'        (if not exist "%pwd%\homedir"        (set "loc=%UserProfile%"))
if /i '%dir%'=='user'           (if not exist "%pwd%\user"           (set "loc=%UserProfile%"))
if /i '%dir%'=='userdir'        (if not exist "%pwd%\userdir"        (set "loc=%UserProfile%"))
if /i '%dir%'=='userhome'       (if not exist "%pwd%\userhome"       (set "loc=%UserProfile%"))

if /i '%dir%'=='downloads'      (if not exist "%pwd%\downloads"      (set "loc=%Downloads%"))
if /i '%dir%'=='mydownloads'    (if not exist "%pwd%\mydownloads"    (set "loc=%Downloads%"))

if /i '%dir%'=='docs'           (if not exist "%pwd%\docs"           (set "loc=%MyDocuments%"))
if /i '%dir%'=='documents'      (if not exist "%pwd%\documents"      (set "loc=%MyDocuments%"))
if /i '%dir%'=='mydocs'         (if not exist "%pwd%\mydocs"         (set "loc=%MyDocuments%"))
if /i '%dir%'=='mydocuments'    (if not exist "%pwd%\mydocuments"    (set "loc=%MyDocuments%"))

if /i '%dir%'=='pics'           (if not exist "%pwd%\pics"           (set "loc=%MyPictures%"))
if /i '%dir%'=='pictures'       (if not exist "%pwd%\pictures"       (set "loc=%MyPictures%"))
if /i '%dir%'=='mypics'         (if not exist "%pwd%\mypics"         (set "loc=%MyPictures%"))
if /i '%dir%'=='mypictures'     (if not exist "%pwd%\mypictures"     (set "loc=%MyPictures%"))

if /i '%dir%'=='vids'           (if not exist "%pwd%\vids"           (set "loc=%MyVideos%"))
if /i '%dir%'=='videos'         (if not exist "%pwd%\videos"         (set "loc=%MyVideos%"))
if /i '%dir%'=='myvids'         (if not exist "%pwd%\myvids"         (set "loc=%MyVideos%"))
if /i '%dir%'=='myvideos'       (if not exist "%pwd%\myvideos"       (set "loc=%MyVideos%"))

if /i '%dir%'=='appdata'        (if not exist "%pwd%\appdata"        (set "loc=%AppData%\.."))

if /i '%dir%'=='progdata'       (if not exist "%pwd%\progdata"       (set "loc=%ProgramData%"))
if /i '%dir%'=='programdata'    (if not exist "%pwd%\programdata"    (set "loc=%ProgramData%"))

if /i '%dir%'=='progfiles'      (if not exist "%pwd%\progfiles"      (set "loc=%ProgramFiles%"))
if /i '%dir%'=='programfiles'   (if not exist "%pwd%\programfiles"   (set "loc=%ProgramFiles%"))

if /i '%dir%'=='progfiles86'    (if not exist "%pwd%\progfiles86"    (set "loc=%ProgramFiles(x86)%"))
if /i '%dir%'=='programfiles86' (if not exist "%pwd%\programfiles86" (set "loc=%ProgramFiles(x86)%"))

if /i '%dir%'=='win'            (if not exist "%pwd%\win"            (set "loc=%SystemRoot%"))
if /i '%dir%'=='windir'         (if not exist "%pwd%\windir"         (set "loc=%SystemRoot%"))
if /i '%dir%'=='windows'        (if not exist "%pwd%\windows"        (set "loc=%SystemRoot%"))

endlocal && cd /d "%loc%"