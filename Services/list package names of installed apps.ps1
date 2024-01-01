Get-AppxPackage | % {if (!($_.IsFramework -or $_.PublisherId -eq "cw5n1h2txyewy")) {$_}} | Select PackageFullName | Sort -Property PackageFullName | Format-Table -AutoSize

Pause


# https://huinck.net/View%20installed%20apps%20in%20Windows%2010%20with%20Powershell.htm
# http://www.auditiait.es/en/how-to-uninstall-original-windows-10-apps-part-1/
