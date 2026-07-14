#!/usr/bin/bash

# ==========================================
# SudoSec Termux Customizer & Theme Manager
# ==========================================

# Color Variables
RED='\e[1;31m'
GREEN='\e[1;32m'
YELLOW='\e[1;33m'
BLUE='\e[1;34m'
CYAN='\e[1;36m'
MAGENTA='\e[1;35m'
RESET='\e[0m'

# Configuration Directories
CONFIG_DIR="$HOME/.sudosec_config"
TERMUX_DIR="$HOME/.termux"
BASHRC="$HOME/.bashrc"

mkdir -p "$CONFIG_DIR"
mkdir -p "$TERMUX_DIR"

# Ensure required packages are installed
install_dependencies() {
    for pkg in figlet toilet curl; do
        if ! command -v $pkg &> /dev/null; then
            echo -e "${YELLOW}[*] Installing required package: $pkg...${RESET}"
            pkg install $pkg -y &> /dev/null
        fi
    done
}

# Display SudoSec Branding Banner
show_banner() {
    clear
    echo -e "${GREEN}"
    echo "  ____            _o____            "
    echo " / ___| _   _  __| / ___|  ___  ___ "
    echo " \___ \| | | |/ _\` \___ \ / _ \/ __|"
    echo "  ___) | |_| | (_| |___) |  __/ (__ "
    echo " |____/ \__,_|\__,_|____/ \___|\___|"
    echo -e "${RESET}"
    echo -e "${CYAN}       Created by SudoSec${RESET}"
    echo -e "${YELLOW}  Visit www.sudosec.in for courses${RESET}"
    echo -e "${BLUE}--------------------------------------------------${RESET}"
}

# ==========================================
# 1. Startup Loading Screen Management
# ==========================================
setup_loading_screen() {
    show_banner
    echo -e "${CYAN}=== Startup Loading Screen Setup ===${RESET}"
    echo "1. Enable / Update Startup Loading Screen"
    echo "2. Change Banner Font Style"
    echo "3. Disable / Remove Startup Loading Screen"
    echo "0. Back to Main Menu"
    echo ""
    read -p "Choose an option: " load_opt

    case $load_opt in
        1)
            read -p "Enter Banner Name (e.g., SudoSec, HACKER, Termux): " banner_name
            echo "$banner_name" > "$CONFIG_DIR/name.txt"
            [ ! -f "$CONFIG_DIR/style.txt" ] && echo "standard" > "$CONFIG_DIR/style.txt"

            # Create the Loader Script
            cat << 'EOF' > "$CONFIG_DIR/loader.sh"
#!/usr/bin/bash
clear
NAME="$(cat $HOME/.sudosec_config/name.txt 2>/dev/null || echo 'SudoSec')"
STYLE="$(cat $HOME/.sudosec_config/style.txt 2>/dev/null || echo 'standard')"

echo -e "\e[1;36mInitializing Termux Environment...\e[0m"
echo -n "["
for i in {1..22}; do
    echo -n "█"
    sleep 0.02
done
echo -e "] \e[1;32m100%\e[0m"
sleep 0.2
clear

echo -e "\e[1;32m"
if command -v figlet >/dev/null 2>&1; then
    figlet -f "$STYLE" "$NAME" 2>/dev/null || figlet "$NAME"
else
    echo "=== $NAME ==="
fi
echo -e "\e[0m"
echo -e "\e[1;33m       www.sudosec.in       \e[0m"
echo "--------------------------------------------------"
EOF
            chmod +x "$CONFIG_DIR/loader.sh"

            # Inject into .bashrc if not already present
            if ! grep -q "sudosec_config/loader.sh" "$BASHRC" 2>/dev/null; then
                echo '[ -f "$HOME/.sudosec_config/loader.sh" ] && source "$HOME/.sudosec_config/loader.sh"' >> "$BASHRC"
            fi
            echo -e "${GREEN}[+] Startup loading screen enabled successfully!${RESET}"
            sleep 2
            ;;
        2)
            echo -e "${CYAN}Select Banner Font Style:${RESET}"
            echo "1. Standard   2. Slant    3. Shadow   4. Small"
            echo "5. Bubble     6. Big      7. Script   8. Block"
            read -p "Choose style (1-8): " style_opt
            case $style_opt in
                1) echo "standard" > "$CONFIG_DIR/style.txt" ;;
                2) echo "slant" > "$CONFIG_DIR/style.txt" ;;
                3) echo "shadow" > "$CONFIG_DIR/style.txt" ;;
                4) echo "small" > "$CONFIG_DIR/style.txt" ;;
                5) echo "bubble" > "$CONFIG_DIR/style.txt" ;;
                6) echo "big" > "$CONFIG_DIR/style.txt" ;;
                7) echo "script" > "$CONFIG_DIR/style.txt" ;;
                8) echo "block" > "$CONFIG_DIR/style.txt" ;;
                *) echo "standard" > "$CONFIG_DIR/style.txt" ;;
            esac
            echo -e "${GREEN}[+] Banner style updated!${RESET}"
            sleep 1.5
            ;;
        3)
            rm -f "$CONFIG_DIR/loader.sh"
            sed -i '/sudosec_config\/loader.sh/d' "$BASHRC" 2>/dev/null
            echo -e "${RED}[!] Startup loading screen removed.${RESET}"
            sleep 1.5
            ;;
        0) return ;;
        *) echo -e "${RED}Invalid option!${RESET}"; sleep 1 ;;
    esac
}

# ==========================================
# 2. Termux Background & Color Schemes
# ==========================================
apply_theme() {
    cat << EOF > "$TERMUX_DIR/colors.properties"
background=$1
foreground=$2
cursor=$3
EOF
    termux-reload-settings
    echo -e "${GREEN}[+] Theme Applied Successfully!${RESET}"
    sleep 1.5
}

change_background() {
    show_banner
    echo -e "${CYAN}=== Select Termux Color Scheme (10+ Styles) ===${RESET}"
    echo "1. Hacker Matrix (Black & Neon Green)"
    echo "2. Cyberpunk Neon (Dark & Magenta/Cyan)"
    echo "3. Dracula (Dark Purple & Pastel)"
    echo "4. Monokai (Dark Brown & Vibrant)"
    echo "5. Nord (Arctic Blue & Snow White)"
    echo "6. Gruvbox (Retro Warm Dark)"
    echo "7. Solarized Dark (Deep Teal & Cyan)"
    echo "8. Ubuntu Terminal (Aubergine & White)"
    echo "9. Blood Red (Dark & Crimson)"
    echo "10. Ocean Blue (Midnight Blue & Sky Blue)"
    echo "11. Reset to Normal / Default Colors"
    echo "0. Back to Main Menu"
    echo ""
    read -p "Choose a theme (0-11): " bg_opt

    case $bg_opt in
        1) apply_theme "#0d1117" "#00ff66" "#00ff66" ;;
        2) apply_theme "#0a0a12" "#ff00ff" "#00ffff" ;;
        3) apply_theme "#282a36" "#f8f8f2" "#ff79c6" ;;
        4) apply_theme "#272822" "#f8f8f2" "#fd971f" ;;
        5) apply_theme "#2e3440" "#d8dee9" "#88c0d0" ;;
        6) apply_theme "#282828" "#ebdbb2" "#fe8019" ;;
        7) apply_theme "#002b36" "#839496" "#b58900" ;;
        8) apply_theme "#300a24" "#ffffff" "#bb90e2" ;;
        9) apply_theme "#1a0000" "#ff3333" "#ff0000" ;;
        10) apply_theme "#0f172a" "#38bdf8" "#38bdf8" ;;
        11) 
            rm -f "$TERMUX_DIR/colors.properties"
            termux-reload-settings
            echo -e "${YELLOW}[!] Colors reset to default!${RESET}"
            sleep 1.5
            ;;
        0) return ;;
        *) echo -e "${RED}Invalid selection!${RESET}"; sleep 1 ;;
    esac
}

# ==========================================
# 3. Font Customization
# ==========================================
download_font() {
    echo -e "${YELLOW}[*] Downloading font... Please wait.${RESET}"
    curl -fLo "$TERMUX_DIR/font.ttf" "$1" 2>/dev/null
    if [ $? -eq 0 ]; then
        termux-reload-settings
        echo -e "${GREEN}[+] Font applied successfully!${RESET}"
    else
        echo -e "${RED}[-] Failed to download font. Check internet connection.${RESET}"
    fi
    sleep 2
}

change_fonts() {
    show_banner
    echo -e "${CYAN}=== Select Termux Font ===${RESET}"
    echo "1. Hack Nerd Font"
    echo "2. Fira Code Nerd Font"
    echo "3. JetBrains Mono"
    echo "4. Ubuntu Mono"
    echo "5. Source Code Pro"
    echo "6. Roboto Mono"
    echo "7. Reset to Normal / Default Font"
    echo "0. Back to Main Menu"
    echo ""
    read -p "Choose an option (0-7): " font_opt

    BASE_URL="https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts"

    case $font_opt in
        1) download_font "$BASE_URL/Hack/Regular/HackNerdFont-Regular.ttf" ;;
        2) download_font "$BASE_URL/FiraCode/Regular/FiraCodeNerdFont-Regular.ttf" ;;
        3) download_font "$BASE_URL/JetBrainsMono/NoLigatures/Regular/JetBrainsMonoNerdFontMono-Regular.ttf" ;;
        4) download_font "$BASE_URL/UbuntuMono/Regular/UbuntuMonoNerdFont-Regular.ttf" ;;
        5) download_font "$BASE_URL/SourceCodePro/Regular/SauceCodeProNerdFont-Regular.ttf" ;;
        6) download_font "$BASE_URL/RobotoMono/Regular/RobotoMonoNerdFont-Regular.ttf" ;;
        7)
            rm -f "$TERMUX_DIR/font.ttf"
            termux-reload-settings
            echo -e "${YELLOW}[!] Font reset to default!${RESET}"
            sleep 1.5
            ;;
        0) return ;;
        *) echo -e "${RED}Invalid selection!${RESET}"; sleep 1 ;;
    esac
}

# ==========================================
# 4. Extra Customization Features
# ==========================================
extra_features() {
    show_banner
    echo -e "${CYAN}=== Extra Termux Customizations ===${RESET}"
    echo "1. Apply Hacker Shell Prompt (PS1)"
    echo "2. Apply SudoSec Minimal Prompt (PS1)"
    echo "3. Reset Shell Prompt to Default"
    echo "4. Add Useful Shortcuts & Aliases (ll, c, myip, etc.)"
    echo "5. Change Cursor Shape (Block / Bar / Underline)"
    echo "0. Back to Main Menu"
    echo ""
    read -p "Choose an option: " ext_opt

    case $ext_opt in
        1)
            sed -i '/sudosec_prompt/d' "$BASHRC" 2>/dev/null
            echo 'export PS1="\[\e[1;32m\]┌──(\[\e[1;36m\]hacker㉿termux\[\e[1;32m\])-[\[\e[1;37m\]\w\[\e[1;32m\]]\n\[\e[1;32m\]└─\[\e[1;31m\]$\[\e[0m\] # sudosec_prompt"' >> "$BASHRC"
            echo -e "${GREEN}[+] Hacker prompt applied! Open a new session or tab to see it.${RESET}"
            sleep 2
            ;;
        2)
            sed -i '/sudosec_prompt/d' "$BASHRC" 2>/dev/null
            echo 'export PS1="\[\e[1;36m\]SudoSec \[\e[1;33m\]❯\[\e[0m\] # sudosec_prompt"' >> "$BASHRC"
            echo -e "${GREEN}[+] Minimal SudoSec prompt applied! Open a new session to see it.${RESET}"
            sleep 2
            ;;
        3)
            sed -i '/sudosec_prompt/d' "$BASHRC" 2>/dev/null
            echo -e "${YELLOW}[!] Prompt reset to default.${RESET}"
            sleep 1.5
            ;;
        4)
            sed -i '/sudosec_aliases/d' "$BASHRC" 2>/dev/null
            cat << 'EOF' >> "$BASHRC"
alias c='clear' # sudosec_aliases
alias ll='ls -la' # sudosec_aliases
alias myip='curl ifconfig.me; echo ""' # sudosec_aliases
alias ports='netstat -tulanp' # sudosec_aliases
alias update='pkg update && pkg upgrade -y' # sudosec_aliases
EOF
            echo -e "${GREEN}[+] Shortcuts added (c, ll, myip, ports, update).${RESET}"
            sleep 2
            ;;
        5)
            echo "Select Cursor Shape: 1) Block  2) Bar  3) Underline"
            read -p "Choice: " cur_opt
            case $cur_opt in
                1) echo -e "\e[2 q" ;;
                2) echo -e "\e[6 q" ;;
                3) echo -e "\e[4 q" ;;
            esac
            echo -e "${GREEN}[+] Cursor shape updated for this session!${RESET}"
            sleep 1.5
            ;;
        0) return ;;
        *) echo -e "${RED}Invalid option!${RESET}"; sleep 1 ;;
    esac
}

# ==========================================
# 5. Uninstall Script & Revert Changes
# ==========================================
uninstall_script() {
    show_banner
    echo -e "${RED}=== Uninstall SudoSec Customizer ===${RESET}"
    read -p "Are you sure you want to remove all customizations? (y/n): " confirm
    if [[ "$confirm" =~ ^[Yy]$ ]]; then
        echo -e "${YELLOW}[*] Reverting changes...${RESET}"
        sed -i '/sudosec_config/d' "$BASHRC" 2>/dev/null
        sed -i '/sudosec_prompt/d' "$BASHRC" 2>/dev/null
        sed -i '/sudosec_aliases/d' "$BASHRC" 2>/dev/null
        rm -rf "$CONFIG_DIR"
        rm -f "$TERMUX_DIR/colors.properties" "$TERMUX_DIR/font.ttf"
        termux-reload-settings
        echo -e "${GREEN}[+] SudoSec Customizer uninstalled completely. Termux is restored to normal!${RESET}"
        exit 0
    else
        echo -e "${CYAN}[*] Uninstallation canceled.${RESET}"
        sleep 1.5
    fi
}

# ==========================================
# Main Menu Loop
# ==========================================
install_dependencies

while true; do
    show_banner
    echo -e "${CYAN}=== SudoSec Termux Manager ===${RESET}"
    echo "1. Setup / Change Startup Loading Screen"
    echo "2. Change Termux Background (10 Styles + Reset)"
    echo "3. Change Termux Fonts (Nerd Fonts + Reset)"
    echo "4. Extra Features (PS1 Prompt, Aliases, Cursor)"
    echo "5. Uninstall Script & Reset Termux to Normal"
    echo "0. Exit"
    echo ""
    read -p "Enter your choice (0-5): " main_opt

    case $main_opt in
        1) setup_loading_screen ;;
        2) change_background ;;
        3) change_fonts ;;
        4) extra_features ;;
        5) uninstall_script ;;
        0) 
            echo -e "${GREEN}Thank you for using SudoSec Customizer! Visit www.sudosec.in${RESET}"
            exit 0 
            ;;
        *) 
            echo -e "${RED}Invalid option! Please try again.${RESET}"
            sleep 1 
            ;;
    esac
done
