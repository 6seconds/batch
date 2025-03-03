@echo off
for /f "tokens=2 delims=:" %%I in ('netsh interface show interface ^| findstr /R /C:"connected"') do (
    set interfaceName=%%I
    set interfaceName=!interfaceName:~1!
    
    netsh interface ip set dns name="!interfaceName!" source=static addr=1.1.1.3
    netsh interface ip add dns name="!interfaceName!" addr=1.0.0.3 index=2
    netsh interface ipv6 set dns name="!interfaceName!" source=static addr=2606:4700:4700::1113
    netsh interface ipv6 add dns name="!interfaceName!" addr=2606:4700:4700::1003 index=2
)

netsh advfirewall firewall add rule name="Block Non-Cloudflare DNS" dir=out action=block protocol=UDP remoteport=53 remoteip=1.1.1.3,1.0.0.3
netsh advfirewall firewall add rule name="Block Non-Cloudflare DNS" dir=out action=block protocol=TCP remoteport=53 remoteip=1.1.1.3,1.0.0.3

echo 216.239.38.120 www.google.com >> %SystemRoot%\System32\drivers\etc\hosts
echo 216.239.38.120 google.com >> %SystemRoot%\System32\drivers\etc\hosts
echo 204.79.197.220 www.bing.com >> %SystemRoot%\System32\drivers\etc\hosts
echo 204.79.197.220 bing.com >> %SystemRoot%\System32\drivers\etc\hosts

ipconfig /flushdns
