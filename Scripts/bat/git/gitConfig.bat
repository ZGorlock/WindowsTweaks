@echo off
setlocal enabledelayedexpansion

set "key=%~1"

set "scope=--local"
for %%s in (local;system;global) do (
	set test=%%s
	for %%t in (!test!;!test:~0^,1!) do (
		if /i "!key:-=!"=="%%t" (
			set "scope=--!test!"
			set "key="
		)
	)
)

if "!key!"=="" (set "key=%~2")
if "!key:~0,1!"=="-" (
	set "command=!key!"
) else if "!key!"=="" (
	set "command=--list"
) else (
	set "command=--get !key!"
)

git config !scope! !command!
