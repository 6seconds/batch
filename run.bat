@ECHO OFF

SET "Username=mrpond"
SET "Repository=BlockTheSpot"

SET "Destination=%APPDATA%\SPOTIFY"
SET "URLFile=%~dp0latest_url.txt"
SET "ZipFile=%~dp0downloaded.zip"
SET "ExtractPath=%~dp0extracted"

powershell -Command "$url = 'https://api.github.com/repos/%Username%/%Repository%/releases/latest'; $json = Invoke-RestMethod $url; $latestURL = $json.assets | Where-Object { $_.name -like '*.zip' } | Select-Object -ExpandProperty browser_download_url; Set-Content -Path '%URLFile%' -Value $latestURL"

SET /P "LatestURL=" < "%URLFile%"

powershell -Command "(New-Object System.Net.WebClient).DownloadFile('%LatestURL%', '%ZipFile%')"

IF NOT EXIST "%ExtractPath%" (
MKDIR "%ExtractPath%"
)
powershell -Command "Expand-Archive -Path '%ZipFile%' -DestinationPath '%ExtractPath%' -Force"

DEL "%ZipFile%"

ROBOCOPY "%ExtractPath%" "%Destination%" /E /V /TEE /MOVE

DEL "%URLFile%"
RD /S /Q "%ExtractPath%"
