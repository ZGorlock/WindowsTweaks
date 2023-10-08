@echo off
setlocal enabledelayedexpansion

set "loc=%~1"
if "!loc:~0,1!"=="/" (
	set "flag=!loc:~1!"
	set "loc=%~2"
)
if '!loc!'=='' (set loc=.)

if /i '!flag:~-1!'=='D' (set "dirFilter=-Directory")

if /i '!flag:~-1!'=='S' (set "typeFilter=-eq 'SymbolicLink'")
if /i '!flag:~-1!'=='D' (set "typeFilter=-eq 'SymbolicLink'")
if /i '!flag:~-1!'=='H' (set "typeFilter=-eq 'HardLink'")
if /i '!flag:~-1!'=='J' (set "typeFilter=-eq 'Junction'")

pshell "Get-ChildItem '!loc!' -Recurse -Force !dirFilter! | ?{$_.LinkType !typeFilter!} | Select-Object FullName,LinkType,@{ Name="Targets"; Expression={$_.Target -join "`t"} } | Format-Table | Out-String -Width 9999"
