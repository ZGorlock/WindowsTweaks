@echo off
setlocal enabledelayedexpansion

set "typeFilter="
set "flags="
set "location=."

:readArgs
	if not '%1'=='' (
		set "arg=%~1"
		if "!arg:~0,1!"=="/" (
			if /i '!arg!'=='/S' (set "typeFilter=-eq 'SymbolicLink'")
			if /i '!arg!'=='/D' (set "typeFilter=-eq 'SymbolicLink'")
			if /i '!arg!'=='/H' (set "typeFilter=-eq 'HardLink'")
			if /i '!arg!'=='/J' (set "typeFilter=-eq 'Junction'")
			if /i '!arg!'=='/D' (set "flags=!flags! -Directory")
			if /i '!arg!'=='/R' (set "flags=!flags! -Recurse")
			if /i '!arg!'=='/F' (set "flags=!flags! -Force")
		) else if not "!arg!"=="" (
			set "location=!arg!"
		)
		shift && goto readArgs
	)

pshell "Get-ChildItem '!location!' !flags! | ?{$_.LinkType !typeFilter!} | Select-Object @{ Name='FullName'; Expression={$_.FullName + '  '} }, @{ Name='LinkType'; Expression={$_.LinkType + '  '} }, @{ Name='Targets'; Expression={$_.Target -join ', '} } | Format-Table -Property FullName, LinkType, Targets -AutoSize | Out-String -Width 9999"
