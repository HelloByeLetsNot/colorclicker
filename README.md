# Color Clicker Bot

![Clicker Bot Interface](https://github.com/HelloByeLetsNot/colorclicker/blob/main/clicker.png?raw=true)

This bot is designed to automatically click on a specified color within a defined area on the screen, streamlining repetitive actions where color-based targeting is essential. With a simple GUI for selecting colors, setting search areas, and adjusting click delay, users can easily configure the bot to suit various tasks.

### Features
- **Color Selection**: Choose a color from the built-in RGB/HSV wheel and sliders, enter an exact color code, or use the screen dropper to sample a browser pixel.
- **Area Selection**: Drag to create a search area, focusing the bot’s actions on a specific screen region.
- **Auto-Clicking**: Automatically clicks on the first instance of the selected color detected within the area.
- **Loop Delay and Color Tolerance**: Customize the interval between clicks and how closely screen pixels must match the selected color.
- **Hotkey Controls**: Start/stop the bot with `Ctrl+S`, toggle clicking with `Ctrl+Space`, and select color with `F`.

Built with PyAutoGUI, OpenCV, and Tkinter, this program is ideal for automating interactions in environments where specific color elements require consistent attention.

## Run it

Install Python 3.10 or newer, then install the dependencies:

```bash
python -m venv .venv
```

Windows PowerShell:

```powershell
.venv\Scripts\Activate.ps1
python -m pip install -r requirements.txt
python Win-main.py
```

To install it as a desktop application on Windows, right-click `setup-windows.ps1`, choose **Run with PowerShell**, and approve the execution if prompted. The script creates the virtual environment, installs dependencies, and adds a **Color Clicker** shortcut to your Desktop. Double-click that shortcut to launch the GUI without a console window. If PowerShell blocks the script, run:

```powershell
Set-ExecutionPolicy -Scope Process Bypass
.\setup-windows.ps1
```

Linux:

```bash
source .venv/bin/activate
python -m pip install -r requirements.txt
python Linux-main.py
```

On Linux, grant the terminal accessibility/input permissions requested by your desktop environment. On macOS, use the Linux entry point with Accessibility and Screen Recording permissions.

## Use it with a browser game

1. Open the game and keep the game window visible; do not minimize it.
2. Choose a color from the RGB wheel or enter an exact `#RRGGBB` / `R, G, B` code and click **Apply Code**. To sample the browser directly, click **Pick Color From Screen** (or press `F`), switch to the browser with `Alt+Tab`, then click the exact pixel. The sampling click is intercepted so it won't activate the game element.
3. Leave **Full Screen Scan** enabled to find the color anywhere on the visible desktop, or optionally draw a search area to restrict where it looks.
4. Click **Start Scanning**. The app minimizes to reveal the browser and keeps scanning even while the color is absent. When it finds the nearest matching region, it moves there, clicks, then moves at least 80 pixels away when possible so browser hover styling can reset. If no click succeeds for 1 second, it forces a full-screen rescan for 2 seconds without moving the cursor to the screen corner. PyAutoGUI's corner safety stop remains enabled. It pauses briefly after a click to allow the browser to update; the default scan delay is 0.15 seconds and can be adjusted. Only one app instance can run at a time to prevent its global mouse/keyboard listeners from competing. Temporary capture/input errors are retried. Press **Ctrl+S** to stop and restore the app, or **Ctrl+Space** to pause/resume clicks. Adjust **Color Tolerance** if button shading or anti-aliasing prevents a match.

The bot searches the whole screen by default, so keep the browser visible and choose a color that identifies the intended target. Use it only with games and services where automation is allowed.
