ipconfig /all

ipconfig /release
ipconfig /flushdns
ipconfig /renew

netsh winsock reset
netsh int ip reset
netsh int ipv4 reset
netsh int ipv6 reset
:: netsh interface ip delete destinationcache

shutdown /r /f


:: https://www.intel.com/content/www/us/en/support/articles/000058982/wireless/intel-killer-wi-fi-products.html
:: https://www.minitool.com/news/reset-tcp-ip-windows-10.html
