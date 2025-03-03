@echo off
cd /d "%~dp0"

setlocal enabledelayedexpansion

set "INPUT_FILE=activate.bat"
set "OUTPUT_FILE=activate_absolute_paths.bat"

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