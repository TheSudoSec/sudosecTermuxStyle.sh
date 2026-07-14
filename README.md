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

## 🛠️ Installation Guide

Open your Termux app and run the following commands step-by-step to install and launch the tool:

### 1. Update Termux & Install Git
```bash
pkg update && pkg upgrade -y
pkg install git -y
