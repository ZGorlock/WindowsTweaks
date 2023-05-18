taskkill /f /im explorer.exe
del "%LocalAppData%\Microsoft\Windows\Explorer\thumbcache*.db" /a
del "%LocalAppData%\Microsoft\Windows\Explorer\iconcache*.db" /a
start explorer.exe
