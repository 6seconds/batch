netsh advfirewall firewall add rule name="Block Discord App" dir=out action=block program="C:\Users\%USERNAME%\AppData\Local\Discord\Update.exe" enable=yes
netsh advfirewall firewall add rule name="Block Discord App" dir=out action=block program="C:\Users\%USERNAME%\AppData\Local\Discord\app-*" enable=yes
