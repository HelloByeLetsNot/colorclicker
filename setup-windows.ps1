$ErrorActionPreference = "Stop"
$appDir = Split-Path -Parent $MyInvocation.MyCommand.Path
$venvPython = Join-Path $appDir ".venv\Scripts\python.exe"
$venvPythonw = Join-Path $appDir ".venv\Scripts\pythonw.exe"
$desktop = [Environment]::GetFolderPath("Desktop")
$shortcutPath = Join-Path $desktop "Color Clicker.lnk"

if (-not (Get-Command python -ErrorAction SilentlyContinue)) {
    throw "Python 3.10 or newer is required. Install it from https://www.python.org/downloads/windows/ and enable 'Add Python to PATH'."
}

if (-not (Test-Path $venvPython)) {
    python -m venv (Join-Path $appDir ".venv")
}

& $venvPython -m pip install -r (Join-Path $appDir "requirements.txt")

$shell = New-Object -ComObject WScript.Shell
$shortcut = $shell.CreateShortcut($shortcutPath)
$shortcut.TargetPath = Join-Path $appDir "launch-colorclicker.bat"
$shortcut.WorkingDirectory = $appDir
$shortcut.Description = "Launch Color Clicker"
$shortcut.IconLocation = "$env:SystemRoot\System32\SHELL32.dll,137"
$shortcut.Save()

Write-Host "Color Clicker is installed."
Write-Host "Desktop shortcut: $shortcutPath"
Write-Host "Double-click the shortcut to launch the app."
