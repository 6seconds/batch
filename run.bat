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

netsh advfirewall firewall add rule name="Block Reddit" dir=out action=block remoteip=151.101.1.140,151.101.65.140,151.101.193.140,151.101.129.140 enable=yes
netsh advfirewall firewall add rule name="Block Twitter" dir=out action=block remoteip=104.244.42.0/24 enable=yes
netsh advfirewall firewall add rule name="Block Instagram" dir=out action=block remoteip=157.240.0.0/16,31.13.0.0/16,173.252.64.0/18,69.171.224.0/19,66.220.144.0/20,2a03:2880::/32 enable=yes

ipconfig /flushdns
exit
