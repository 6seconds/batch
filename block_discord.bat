@echo off
netsh advfirewall firewall add rule name="Block Discord Network" dir=out action=block remoteip=162.159.128.0/24,162.159.129.0/24,162.159.130.0/24,162.159.133.0/24,162.159.134.0/24,162.159.135.0/24,104.16.0.0/12,104.17.0.0/12,104.18.0.0/12,104.19.0.0/12,104.20.0.0/12,104.21.0.0/12 enable=yes
(
    echo 127.0.0.1 discord.com
    echo 127.0.0.1 www.discord.com
    echo 127.0.0.1 cdn.discordapp.com
    echo 127.0.0.1 discordapp.com
    echo 127.0.0.1 discord.gg
) >> "%SystemRoot%\System32\drivers\etc\hosts"

ipconfig /flushdns
exit
