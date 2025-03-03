@echo off
netsh interface ip set dns name="Ethernet" source=static addr=1.1.1.3
netsh interface ip add dns name="Ethernet" addr=1.0.0.3 index=2
netsh interface ipv6 set dns name="Ethernet" source=static addr=2606:4700:4700::1113
netsh interface ipv6 add dns name="Ethernet" addr=2606:4700:4700::1003 index=2

netsh interface ip set dns name="Wi-Fi" source=static addr=1.1.1.3
netsh interface ip add dns name="Wi-Fi" addr=1.0.0.3 index=2
netsh interface ipv6 set dns name="Wi-Fi" source=static addr=2606:4700:4700::1113
netsh interface ipv6 add dns name="Wi-Fi" addr=2606:4700:4700::1003 index=2

netsh advfirewall firewall add rule name="Block Non-Cloudflare DNS" dir=out action=block protocol=UDP remoteport=53
netsh advfirewall firewall add rule name="Block Non-Cloudflare DNS" dir=out action=block protocol=TCP remoteport=53

(
    echo 216.239.38.120 www.google.com
    echo 216.239.38.120 google.com
    echo 204.79.197.220 www.bing.com
    echo 204.79.197.220 bing.com
) >> "%SystemRoot%\System32\drivers\etc\hosts"

ipconfig /flushdns
echo DNS settings updated successfully!
pause
exit
