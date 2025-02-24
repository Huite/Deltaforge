REM The uninstall is unaware of the Deltaforge dir pixi-pack made.
REM We use this script to delete the directory instead.
@echo off
cd /d "%~dp0"
rmdir /s /q deltaforge
exit /b 0
