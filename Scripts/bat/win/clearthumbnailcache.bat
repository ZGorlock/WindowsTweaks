@echo off

taskkill /f /im explorer.exe

del /a /q /f    "%LocalAppData%\Microsoft\Windows\Explorer\thumbcache*.db"

del /a /q       "%LocalAppData%\IconCache.db"
del /a /q /f    "%LocalAppData%\Microsoft\Windows\Explorer\iconcache*.db"
del /a /q /f /s "%LocalAppData%\Packages\Microsoft.Windows.Search_cw5n1h2txyewy\LocalState\AppIconCache\*.*"

start explorer.exe
