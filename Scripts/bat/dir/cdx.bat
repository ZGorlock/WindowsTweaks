@echo off
setlocal enabledelayedexpansion

set "loc=%~1"
set "pwd=%cd%"

set "dir=!loc!"
set "dir=!dir:-=!"
set "dir=!dir:_=!"

if /i '!dir!'=='~'               (if not exist "!pwd!\~"               (set "loc=%UserProfile%"))
if /i '!dir!'=='home'            (if not exist "!pwd!\home"            (set "loc=%UserProfile%"))
if /i '!dir!'=='homedir'         (if not exist "!pwd!\homedir"         (set "loc=%UserProfile%"))
if /i '!dir!'=='user'            (if not exist "!pwd!\user"            (set "loc=%UserProfile%"))
if /i '!dir!'=='userdir'         (if not exist "!pwd!\userdir"         (set "loc=%UserProfile%"))
if /i '!dir!'=='userhome'        (if not exist "!pwd!\userhome"        (set "loc=%UserProfile%"))

if /i '!dir!'=='dl'              (if not exist "!pwd!\dl"              (set "loc=%Downloads%"))
if /i '!dir!'=='download'        (if not exist "!pwd!\download"        (set "loc=%Downloads%"))
if /i '!dir!'=='downloads'       (if not exist "!pwd!\downloads"       (set "loc=%Downloads%"))
if /i '!dir!'=='mydownloads'     (if not exist "!pwd!\mydownloads"     (set "loc=%Downloads%"))

if /i '!dir!'=='doc'             (if not exist "!pwd!\doc"             (set "loc=%MyDocuments%"))
if /i '!dir!'=='docs'            (if not exist "!pwd!\docs"            (set "loc=%MyDocuments%"))
if /i '!dir!'=='document'        (if not exist "!pwd!\document"        (set "loc=%MyDocuments%"))
if /i '!dir!'=='documents'       (if not exist "!pwd!\documents"       (set "loc=%MyDocuments%"))
if /i '!dir!'=='mydocs'          (if not exist "!pwd!\mydocs"          (set "loc=%MyDocuments%"))
if /i '!dir!'=='mydocuments'     (if not exist "!pwd!\mydocuments"     (set "loc=%MyDocuments%"))

if /i '!dir!'=='pic'             (if not exist "!pwd!\pic"             (set "loc=%MyPictures%"))
if /i '!dir!'=='pics'            (if not exist "!pwd!\pics"            (set "loc=%MyPictures%"))
if /i '!dir!'=='picture'         (if not exist "!pwd!\picture"         (set "loc=%MyPictures%"))
if /i '!dir!'=='pictures'        (if not exist "!pwd!\pictures"        (set "loc=%MyPictures%"))
if /i '!dir!'=='mypics'          (if not exist "!pwd!\mypics"          (set "loc=%MyPictures%"))
if /i '!dir!'=='mypictures'      (if not exist "!pwd!\mypictures"      (set "loc=%MyPictures%"))

if /i '!dir!'=='vid'             (if not exist "!pwd!\vid"             (set "loc=%MyVideos%"))
if /i '!dir!'=='vids'            (if not exist "!pwd!\vids"            (set "loc=%MyVideos%"))
if /i '!dir!'=='video'           (if not exist "!pwd!\video"           (set "loc=%MyVideos%"))
if /i '!dir!'=='videos'          (if not exist "!pwd!\videos"          (set "loc=%MyVideos%"))
if /i '!dir!'=='myvids'          (if not exist "!pwd!\myvids"          (set "loc=%MyVideos%"))
if /i '!dir!'=='myvideos'        (if not exist "!pwd!\myvideos"        (set "loc=%MyVideos%"))

if /i '!dir!'=='appdata'         (if not exist "!pwd!\appdata"         (set "loc=%AppData%\.."))

if /i '!dir!'=='appdatalocal'    (if not exist "!pwd!\appdatalocal"    (set "loc=%AppData%\..\Local"))
if /i '!dir!'=='appdatal'        (if not exist "!pwd!\appdatal"        (set "loc=%AppData%\..\Local"))
if /i '!dir!'=='localappdata'    (if not exist "!pwd!\localappdata"    (set "loc=%AppData%\..\Local"))
if /i '!dir!'=='lappdata'        (if not exist "!pwd!\lappdata"        (set "loc=%AppData%\..\Local"))
if /i '!dir!'=='local'           (if not exist "!pwd!\local"           (set "loc=%AppData%\..\Local"))

if /i '!dir!'=='appdatalocallow' (if not exist "!pwd!\appdatalocallow" (set "loc=%AppData%\..\LocalLow"))
if /i '!dir!'=='appdatall'       (if not exist "!pwd!\appdatall"       (set "loc=%AppData%\..\LocalLow"))
if /i '!dir!'=='locallowappdata' (if not exist "!pwd!\locallowappdata" (set "loc=%AppData%\..\LocalLow"))
if /i '!dir!'=='llappdata'       (if not exist "!pwd!\llappdata"       (set "loc=%AppData%\..\LocalLow"))
if /i '!dir!'=='locallow'        (if not exist "!pwd!\locallow"        (set "loc=%AppData%\..\LocalLow"))

if /i '!dir!'=='appdataroaming'  (if not exist "!pwd!\appdataroaming"  (set "loc=%AppData%\..\Roaming"))
if /i '!dir!'=='appdatar'        (if not exist "!pwd!\appdatar"        (set "loc=%AppData%\..\Roaming"))
if /i '!dir!'=='roamingappdata'  (if not exist "!pwd!\roamingappdata"  (set "loc=%AppData%\..\Roaming"))
if /i '!dir!'=='rappdata'        (if not exist "!pwd!\rappdata"        (set "loc=%AppData%\..\Roaming"))
if /i '!dir!'=='roaming'         (if not exist "!pwd!\roaming"         (set "loc=%AppData%\..\Roaming"))

if /i '!dir!'=='pdata'           (if not exist "!pwd!\pdata"           (set "loc=%ProgramData%"))
if /i '!dir!'=='progdata'        (if not exist "!pwd!\progdata"        (set "loc=%ProgramData%"))
if /i '!dir!'=='programdata'     (if not exist "!pwd!\programdata"     (set "loc=%ProgramData%"))

if /i '!dir!'=='pfiles'          (if not exist "!pwd!\pfiles"          (set "loc=%ProgramFiles%"))
if /i '!dir!'=='progfiles'       (if not exist "!pwd!\progfiles"       (set "loc=%ProgramFiles%"))
if /i '!dir!'=='programfiles'    (if not exist "!pwd!\programfiles"    (set "loc=%ProgramFiles%"))

if /i '!dir!'=='pfiles86'        (if not exist "!pwd!\pfiles86"        (set "loc=%ProgramFiles(x86)%"))
if /i '!dir!'=='progfiles86'     (if not exist "!pwd!\progfiles86"     (set "loc=%ProgramFiles(x86)%"))
if /i '!dir!'=='programfiles86'  (if not exist "!pwd!\programfiles86"  (set "loc=%ProgramFiles(x86)%"))

if /i '!dir!'=='startup'         (if not exist "!pwd!\startup"         (set "loc=%Startup%"))
if /i '!dir!'=='sstartup'        (if not exist "!pwd!\sstartup"        (set "loc=%Startup%"))
if /i '!dir!'=='sysstartup'      (if not exist "!pwd!\sysstartup"      (set "loc=%Startup%"))
if /i '!dir!'=='systemstartup'   (if not exist "!pwd!\systemstartup"   (set "loc=%Startup%"))

if /i '!dir!'=='ustartup'        (if not exist "!pwd!\ustartup"        (set "loc=%UserStartup%"))
if /i '!dir!'=='userstartup'     (if not exist "!pwd!\userstartup"     (set "loc=%UserStartup%"))

if /i '!dir!'=='start'           (if not exist "!pwd!\start"           (set "loc=%StartMenu%"))
if /i '!dir!'=='startmenu'       (if not exist "!pwd!\startmenu"       (set "loc=%StartMenu%"))
if /i '!dir!'=='sstartmenu'      (if not exist "!pwd!\sstartmenu"      (set "loc=%StartMenu%"))
if /i '!dir!'=='sysstartmenu'    (if not exist "!pwd!\sysstartmenu"    (set "loc=%StartMenu%"))
if /i '!dir!'=='systemstartmenu' (if not exist "!pwd!\systemstartmenu" (set "loc=%StartMenu%"))

if /i '!dir!'=='ustart'          (if not exist "!pwd!\ustart"          (set "loc=%UserStartMenu%"))
if /i '!dir!'=='userstart'       (if not exist "!pwd!\userstart"       (set "loc=%UserStartMenu%"))
if /i '!dir!'=='ustartmenu'      (if not exist "!pwd!\ustartmenu"      (set "loc=%UserStartMenu%"))
if /i '!dir!'=='userstartmenu'   (if not exist "!pwd!\userstartmenu"   (set "loc=%UserStartMenu%"))

if /i '!dir!'=='win'             (if not exist "!pwd!\win"             (set "loc=%WinDir%"))
if /i '!dir!'=='windir'          (if not exist "!pwd!\windir"          (set "loc=%WinDir%"))
if /i '!dir!'=='winhome'         (if not exist "!pwd!\winhome"         (set "loc=%WinDir%"))
if /i '!dir!'=='windows'         (if not exist "!pwd!\windows"         (set "loc=%WinDir%"))

if /i '!dir!'=='systemroot'      (if not exist "!pwd!\systemroot"      (set "loc=%SystemRoot%"))
if /i '!dir!'=='sysroot'         (if not exist "!pwd!\sysroot"         (set "loc=%SystemRoot%"))

endlocal && cd /d "%loc%"
