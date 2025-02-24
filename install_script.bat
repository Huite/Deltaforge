@echo off
cd /d "%~dp0"
echo Starting pixi-pack installation...

REM Run the unpacker
pixi-pack.exe unpack --output-directory "." --env-name deltaforge "deltaforge.tar"

REM Check if it was successful
if %ERRORLEVEL% NEQ 0 (
  echo Installation failed with error code %ERRORLEVEL%
  exit /b %ERRORLEVEL%
)

echo Installation completed successfully
echo Cleaning up temporary files...

REM Delete the tar file
del /f /q deltaforge.tar

REM Delete the pixi-pack executable
del /f /q pixi-pack.exe

echo Cleanup completed
exit /b 0
