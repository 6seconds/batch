@ECHO OFF

SET "Username=mrpond"
SET "Repository=BlockTheSpot"

SET "Destination=%APPDATA%\SPOTIFY"
SET "URLFile=%~dp0latest_url.txt"
SET "ZipFile=%~dp0downloaded.zip"
SET "ExtractPath=%~dp0extracted"

REM Use PowerShell to retrieve the latest release URL
powershell -Command "$url = 'https://api.github.com/repos/%Username%/%Repository%/releases/latest'; $json = Invoke-RestMethod $url; $latestURL = $json.assets | Where-Object { $_.name -like '*.zip' } | Select-Object -ExpandProperty browser_download_url; Set-Content -Path '%URLFile%' -Value $latestURL"

SET /P "LatestURL=" < "%URLFile%"

REM Download the latest version's zip file using PowerShell
powershell -Command "(New-Object System.Net.WebClient).DownloadFile('%LatestURL%', '%ZipFile%')"

REM Create the extraction folder if it doesn't exist
IF NOT EXIST "%ExtractPath%" (
MKDIR "%ExtractPath%"
)

REM Extract the contents of the zip file using PowerShell
powershell -Command "Expand-Archive -Path '%ZipFile%' -DestinationPath '%ExtractPath%' -Force"

REM Cleanup: Delete the downloaded zip file
DEL "%ZipFile%"

REM Move the extracted files to the destination folder
ROBOCOPY "%ExtractPath%" "%Destination%" /E /V /TEE /MOVE

REM Cleanup: Delete the URL file and the extracted folder
DEL "%URLFile%"
RD /S /Q "%ExtractPath%"