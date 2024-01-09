taskkill /f /im explorer.exe

del /a /q /f    "%LocalAppData%\Microsoft\Windows\Explorer\thumbcache*.db"

del /a /q       "%LocalAppData%\IconCache.db"
del /a /q /f    "%LocalAppData%\Microsoft\Windows\Explorer\iconcache*.db"
del /a /q /f /s "%LocalAppData%\Packages\Microsoft.Windows.Search_cw5n1h2txyewy\LocalState\AppIconCache\*.*"

shutdown /r /f


:: https://www.winability.com/how-to-erase-icon-thumbnail-cache-windows-8/
:: https://www.tenforums.com/tutorials/5645-rebuild-icon-cache-windows-10-a.html
:: https://www.tenforums.com/tutorials/5655-clear-reset-thumbnail-cache-windows-10-a.html
