@echo off
setlocal enabledelayedexpansion

:: Find the active network interface (Wi-Fi or Ethernet)
for /f "tokens=1,2 delims=:" %%A in ('netsh interface show interface ^| findstr /I "connected"') do (
    set "interfaceName=%%B"
    set "interfaceName=!interfaceName:~1!"
    
    echo Configuring DNS for: !interfaceName!

    :: Set IPv4 DNS
    netsh interface ip set dns name="!interfaceName!" source=static addr=1.1.1.3
    netsh interface ip add dns name="!interfaceName!" addr=1.0.0.3 index=2

    :: Set IPv6 DNS
    netsh interface ipv6 set dns name="!interfaceName!" source=static addr=2606:4700:4700::1113
    netsh interface ipv6 add dns name="!interfaceName!" addr=2606:4700:4700::1003 index=2
)

:: Block all non-Cloudflare DNS traffic (UDP/TCP on port 53)
netsh advfirewall firewall add rule name="Block Non-Cloudflare DNS" dir=out action=block protocol=UDP remoteport=53
netsh advfirewall firewall add rule name="Block Non-Cloudflare DNS" dir=out action=block protocol=TCP remoteport=53

:: Force SafeSearch for Google and Bing via hosts file
(
    echo 216.239.38.120 www.google.com
    echo 216.239.38.120 google.com
    echo 204.79.197.220 www.bing.com
    echo 204.79.197.220 bing.com
) >> "%SystemRoot%\System32\drivers\etc\hosts"

:: Flush DNS cache to apply changes
ipconfig /flushdns

echo DNS settings have been updated successfully!
pause
exit
