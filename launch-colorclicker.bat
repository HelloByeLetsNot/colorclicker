@echo off
setlocal
set "APP_DIR=%~dp0"
set "PYTHONW=%APP_DIR%.venv\Scripts\pythonw.exe"

if not exist "%PYTHONW%" (
    powershell.exe -NoProfile -ExecutionPolicy Bypass -Command ^
        "Add-Type -AssemblyName PresentationFramework; [System.Windows.MessageBox]::Show('Run setup-windows.ps1 first to install Color Clicker dependencies.','Color Clicker')"
    exit /b 1
)

start "" "%PYTHONW%" "%APP_DIR%Win-main.py"
