@echo off
netsh interface ip set dns name="Ethernet" source=static addr=1.1.1.3
netsh interface ip add dns name="Ethernet" addr=1.0.0.3 index=2
netsh interface ipv6 set dns name="Ethernet" source=static addr=2606:4700:4700::1113
netsh interface ipv6 add dns name="Ethernet" addr=2606:4700:4700::1003 index=2

netsh interface ip set dns name="Wi-Fi" source=static addr=1.1.1.3
netsh interface ip add dns name="Wi-Fi" addr=1.0.0.3 index=2
netsh interface ipv6 set dns name="Wi-Fi" source=static addr=2606:4700:4700::1113
netsh interface ipv6 add dns name="Wi-Fi" addr=2606:4700:4700::1003 index=2

netsh advfirewall firewall add rule name="Force SafeSearch" dir=out action=block remoteip=216.239.38.120,216.239.38.119 enable=yes
ipconfig /flushdns
exit
