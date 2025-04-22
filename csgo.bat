@echo off

>nul 2>&1 "%SYSTEMROOT%\system32\cacls.exe" "%SYSTEMROOT%\system32\config\system"
if '%errorlevel%' NEQ '0' (
    echo Requesting administrative privileges...
    powershell Start-Process '%0' -Verb runAs
    exit /b
)


set hostsPath=%SystemRoot%\System32\drivers\etc\hosts


echo Blocking CSGO gambling websites...
(
echo 127.0.0.1 csgoroll.com
echo 127.0.0.1 www.csgoroll.com
echo 127.0.0.1 gamdom.com
echo 127.0.0.1 www.gamdom.com
echo 127.0.0.1 csgotower.com
echo 127.0.0.1 www.csgotower.com
echo 127.0.0.1 csgobig.com
echo 127.0.0.1 www.csgobig.com
echo 127.0.0.1 duelbits.com
echo 127.0.0.1 www.duelbits.com
echo 127.0.0.1 datdrop.com
echo 127.0.0.1 www.datdrop.com
echo 127.0.0.1 csgoempire.com
echo 127.0.0.1 www.csgoempire.com
echo 127.0.0.1 hellcase.com
echo 127.0.0.1 www.hellcase.com
echo 127.0.0.1 farmskins.com
echo 127.0.0.1 www.farmskins.com
) >> "%hostsPath%"

echo Done! Gambling sites are now blocked.
pause
