#!/bin/bash

# Set colors for better visibility
RED='\033[0;31m'
GREEN='\033[0;32m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Function to display colored messages
function print_message {
    echo -e "${1}${2}${NC}"
}

# Print Arch Linux art
print_message "${BLUE}" "———————————————————————————————————————————————${NC}"
print_message "${BLUE}" "Arch Linux${NC}"
print_message "${BLUE}" "BSPWM configuration files by masajinobe${NC}"
print_message "${BLUE}" "———————————————————————————————————————————————${NC}"

# Install essential packages
print_message "${BLUE}[INFO] Installing essential packages...${NC}"
sudo pacman -Syu --needed --noconfirm nano git reflector base-devel

# Set MAKEFLAGS for faster compilation (adjust the value based on your system)
print_message "${BLUE}[INFO] Setting MAKEFLAGS for faster compilation...${NC}"
echo 'MAKEFLAGS="-j8"' | sudo tee -a /etc/makepkg.conf

# Enable parallel downloading of packages
print_message "${BLUE}[INFO] Enabling parallel downloading of packages...${NC}"
echo 'ParallelDownloads = 5' | sudo tee -a /etc/pacman.conf

# Run reflector to update mirrorlist
print_message "${BLUE}[INFO] Running reflector to update mirrorlist...${NC}"
sudo reflector --verbose --latest 10 -p https --sort rate --save /etc/pacman.d/mirrorlist

# Clone and install Yay
print_message "${BLUE}[INFO] Cloning and installing Yay...${NC}"
cd $HOME
git clone https://aur.archlinux.org/yay.git && cd yay
makepkg -si

# Install required packages using Yay
print_message "${BLUE}[INFO] Installing required packages using Yay...${NC}"
yay -S --needed --noconfirm \
    xorg xorg-xinit xorg-xrdb \
    bspwm sxhkd polybar dmenu2 feh kitty fish dunst betterlockscreen \
    acpid brightnessctl \
    thunar xdg-user-dirs xfce-polkit tumbler lxappearance-gtk3 \
    visual-studio-code-bin nano \
    mpv ffmpeg ffmpegthumbnailer \
    telegram-desktop qbittorrent discord chromium \
    fastfetch btop lsd fzf fd bat maim xdotool xclip reflector \
    p7zip zip unrar unzip \
    ttf-jetbrains-mono-nerd noto-fonts noto-fonts-emoji noto-fonts-cjk papirus-icon-theme \
    mesa mesa-utils lib32-mesa vulkan-intel lib32-vulkan-intel vulkan-icd-loader lib32-vulkan-icd-loader \
    bluez bluez-utils sof-firmware

# Update font cache
print_message "${BLUE}[INFO] Updating font cache...${NC}"
fc-cache -fv

# Copy configuration files
print_message "${BLUE}[INFO] Copying configuration files...${NC}"
mkdir -p $HOME/.config && cp -r $HOME/arch_bspwm/config/* $HOME/.config
mkdir -p $HOME/.local/bin && cp -r $HOME/arch_bspwm/bin/* $HOME/.local/bin
cp -r $HOME/arch_bspwm/misc/* $HOME
mkdir -p $HOME/.themes && cp -r $HOME/arch_bspwm/themes/* $HOME/.themes

# Set execute permissions for scripts
print_message "${BLUE}[INFO] Setting execute permissions for scripts...${NC}"
sudo chmod +x $HOME/.config/bspwm/bspwmrc
sudo chmod +x $HOME/.config/polybar/polybar.sh

# Enable services
print_message "${BLUE}[INFO] Enabling services...${NC}"
sudo systemctl enable acpid.service
sudo systemctl enable bluetooth.service

# Adding language locale
print_message "${BLUE}[INFO] Adding language locale...${NC}"
echo "ru_RU.UTF-8 UTF-8" | sudo tee -a /etc/locale.gen
locale-gen

# Set X11 keymap
print_message "${BLUE}[INFO] Setting X11 keymap...${NC}"
localectl --no-convert set-x11-keymap us,ru pc105+inet qwerty grp:alt_shift_toggle

print_message "${BLUE}[INFO] Installation completed successfully.${NC}"
