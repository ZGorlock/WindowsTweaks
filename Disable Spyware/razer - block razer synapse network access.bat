@ setlocal enableextensions 
@ echo off

cd /d "C:/Program Files (x86)/Razer"
for /R %%a in (*.exe) do (
echo "%%a"
netsh advfirewall firewall add rule name="Blocked Razer Program %%a" dir=out program="%%a" action=block
netsh advfirewall firewall add rule name="Blocked Razer Program %%a" dir=in program="%%a" action=block
)

cd /d "C:/Program Files (x86)/Razer Chroma SDK"
for /R %%a in (*.exe) do (
echo "%%a"
netsh advfirewall firewall add rule name="Blocked Razer Program %%a" dir=out program="%%a" action=block
netsh advfirewall firewall add rule name="Blocked Razer Program %%a" dir=in program="%%a" action=block
)

cd /d "C:/Program Files/Razer"
for /R %%a in (*.exe) do (
echo "%%a"
netsh advfirewall firewall add rule name="Blocked Razer Program %%a" dir=out program="%%a" action=block
netsh advfirewall firewall add rule name="Blocked Razer Program %%a" dir=in program="%%a" action=block
)

cd /d "C:/Program Files/Razer Chroma SDK"
for /R %%a in (*.exe) do (
echo "%%a"
netsh advfirewall firewall add rule name="Blocked Razer Program %%a" dir=out program="%%a" action=block
netsh advfirewall firewall add rule name="Blocked Razer Program %%a" dir=in program="%%a" action=block
)
