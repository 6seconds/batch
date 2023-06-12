@ECHO OFF
SET "Destination=%APPDATA%\SPOTIFY"
START /WAIT cmd /k "ROBOCOPY "%~dp0addons" "%Destination%" /E /V /TEE /LOG:"%~dp0log.txt"
