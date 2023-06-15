@echo off
taskkill /f /im HelpPane.exe
takeown /f %WinDir%\HelpPane.exe
icacls %WinDir%\HelpPane.exe /deny Everyone:(X)


:: https://answers.microsoft.com/en-us/windows/forum/windows_10-other_settings-winpc/how-do-i-stop-f1-opening-a-browser-window-on-how/7f68f9b8-9d87-43a5-9a79-db87702254b5?page=1
