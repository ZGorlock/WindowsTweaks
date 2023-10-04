@echo off
setlocal enabledelayedexpansion

for /f "tokens=*" %%x in ('gitRemoteBranches') do (
	set "branch=%%x"
	if "!branch!"=="!branch:->=!" (
		call gitCheckout "!branch:origin/=!"
	)
)

call gitSwitch
call gitSyncAll
