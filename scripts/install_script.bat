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
echo Replacing relative paths with absolute paths in activation script.
setlocal enabledelayedexpansion

set "INPUT_FILE=activate.bat"
set "OUTPUT_FILE=activate_abspaths.bat"

if not exist "%INPUT_FILE%" (
    echo Error: Input file "%INPUT_FILE%" not found.
    exit /b 1
)

(
    for /f "usebackq delims=" %%a in ("%INPUT_FILE%") do (
        set "line=%%a"
        set "line=!line:.\deltaforge=%~dp0\deltaforge!"
        echo !line!
    )
) > "%OUTPUT_FILE%"

echo Replacement complete. Modified script saved as "%OUTPUT_FILE%"
echo Cleaning up temporary files...

REM Delete the tar file
del /f /q deltaforge.tar

REM Delete the pixi-pack executable
del /f /q pixi-pack.exe

REM Delete the activate.bat script
del /f /q activate.bat

echo Cleanup completed
exit /b 0
