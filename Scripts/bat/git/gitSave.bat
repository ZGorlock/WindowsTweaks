@echo off
setlocal enabledelayedexpansion

set "url=%~1"

set "out=%~2"
if '!out!'=='' (set "out=%GitsaveDir%")
if '!out!'=='' (set "out=%Downloads%")
if '!out!'=='' (set "out=%UserProfile%\Downloads")

set "source=!url:https://=!"
set "source=!source:github.com/=github.com !"
set "source=!source:/= ! "
set "source=!source:.git =!"

for /f "tokens=1,2,3* delims=?# " %%h in ("!source!") do (
	set "host=%%h"
	set "user=%%i"
	set "repo=%%j"
)
if '!host!'=='' (
	echo No host specified.
	exit /b 1
)
if '!user!'=='' (
	echo No user specified.
	exit /b 1
)
if '!repo!'=='' (
	echo No repo specified.
	exit /b 1
)

set "remote=https://!host!/!user!/!repo!.git"

set "local=!out!\!user! ]] !repo!"
set "local=!local:\\=\!"

git clone "!remote!" "!local!"
