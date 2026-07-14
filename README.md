# sudosecTermuxStyle.sh
Transform your default Termux into a cyberpunk hacker workspace with SudoSec Customizer! Features an automated startup loading screen, custom ASCII banners, 10+ color palettes, a Nerd Font installer, custom PS1 prompts, and useful shell aliases. Includes a clean 1-click uninstaller. Visit www.sudosec.in to learn ethical hacking right now!

# 🛡️ SudoSec Termux Customizer & Theme Manager

![Termux](https://img.shields.io/badge/Platform-Termux-black?style=for-the-badge&logo=android&logoColor=green)
![Script](https://img.shields.io/badge/Language-Bash-4EAA25?style=for-the-badge&logo=gnu-bash&logoColor=white)
![Version](https://img.shields.io/badge/Version-1.0.0-blue?style=for-the-badge)
![License](https://img.shields.io/badge/License-MIT-orange?style=for-the-badge)

**SudoSec Termux Customizer** is an all-in-one, powerful Bash script designed to transform your boring default Termux terminal into a professional, customized, and cyberpunk-inspired workspace. 

Featuring an automated startup loading animation, multiple ASCII banner styles, 10+ custom color palettes, Nerd Font management, productivity shortcuts, and a 1-click clean uninstaller.

---

## ✨ Key Features

* 🚀 **Animated Startup Loading Screen:** Displays a sleek loading progress bar and your custom ASCII name banner every time you open a new Termux session.
* 🎨 **10+ Instant Color Schemes:** Change your terminal background and syntax colors on the fly. Includes themes like *Hacker Matrix, Cyberpunk Neon, Dracula, Monokai, Nord, Gruvbox, Solarized Dark,* and *Blood Red*.
* 🔤 **Nerd Fonts Manager:** Download and apply popular coding fonts directly into Termux (*Hack, Fira Code, JetBrains Mono, Ubuntu Mono, etc.*).
* ⚡ **Extra Terminal Customizations:**
  * Apply a two-line **Hacker PS1 Shell Prompt** (`┌──(hacker㉿termux)...`).
  * Switch terminal cursor shapes (*Block, Bar, Underline*).
  * Auto-inject useful shell aliases and productivity shortcuts (`ll`, `c`, `myip`, `ports`, `update`).
* 🔄 **Instant Factory Reset:** Easily revert fonts, colors, or prompts back to normal at any time.
* 🧹 **Clean Uninstaller:** Option 5 safely scrubs all scripts, configurations, and `.bashrc` modifications, restoring Termux to its factory default state without breaking your shell.

---

## 🛠️ How to Set Up & Install

Setting up **SudoSec Customizer** on your Termux application takes less than two minutes. Follow these simple steps in your terminal:

### 1. Update Packages & Install Dependencies
First, ensure your Termux packages are up to date and install the required tools (`git`, `curl`, `figlet`, and `toilet`):
```bash
pkg update && pkg upgrade -y
pkg install git curl figlet toilet -y

2. Clone the Repository
Download the tool directly to your device from GitHub:
git clone [https://github.com/YourUsername/sudosec-termux.git

3. Grant Execution Permissions
Navigate into the downloaded folder and make the script executable:

cd sudosec-termux
chmod +x sudosec.sh

4. Launch the Tool
Run the script to open the interactive manager:

./sudosec.sh

🎮 How to Use the Customizer
Once you execute ./sudosec.sh, you will be greeted by the interactive SudoSec Termux Manager menu. You do not need any coding knowledge—simply type the number corresponding to your choice and press Enter.

Option,Feature,What It Does
1,Startup Loading Screen,"Creates an animated loading bar and displays your custom ASCII name banner every time you open Termux. You can set any name, choose from 8 font styles (Standard, Slant, Shadow, etc.), or disable it anytime."
2,Change Background,"Choose from 10+ instant color palettes including Hacker Matrix, Cyberpunk Neon, Dracula, Monokai, Nord, and Blood Red. Includes a 1-click option to reset colors back to default."
3,Change Fonts,"Download and apply coding Nerd Fonts (Hack, Fira Code, JetBrains Mono, Ubuntu Mono, etc.) directly into Termux. Includes an instant reset to normal font."
4,Extra Customizations,"Apply a two-line Hacker Shell Prompt (┌──(hacker㉿termux)...), switch terminal cursor shapes (Block, Bar, Underline), and add productivity shell shortcuts (ll, c, myip, ports, update)."
0,Exit,Safely close the manager and return to your command line.


🧹 How to Uninstall & Reset Termux
If you ever want to remove all custom themes, banners, and prompts to restore Termux to its clean factory default state, the script includes a safe, automated uninstaller.

Using the Built-in Uninstaller (Recommended):
Launch the script from your terminal:

cd sudosec-termux
./sudosec.sh

Type 5 (Uninstall Script & Reset Termux to Normal) and press Enter.

Type y to confirm.

What the Uninstaller Does:
Safely removes the startup loading animation and configuration directory (~/.sudosec_config).

Deletes custom theme properties and fonts from the Termux styling folder (~/.termux).

Cleans all SudoSec aliases and shell prompt injections from your ~/.bashrc file without affecting your other personal configurations.

Automatically reloads Termux settings, restoring your terminal 100% to normal instantly.


👥 About & Credits
Created by: SudoSec

Website & Courses: www.sudosec.in

Disclaimer: This script is built for educational and customization purposes. It modifies local Termux appearance files (~/.termux) and appends configurations to ~/.bashrc. Always ensure you download scripts from trusted sources!
