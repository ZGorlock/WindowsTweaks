@echo off

ipconfig /all

ipconfig /release
ipconfig /flushdns
ipconfig /renew

netsh winsock reset
:: netsh int ip reset
:: netsh interface ipv4 reset
:: netsh interface ipv6 reset
