<p align="center">
  <img width="100%" src="readme.png" />
</p>

# BSPWM Config

**BSPWM** Configuration files

## Infomation

|       OS       |                    [Arch Linux](https://archlinux.org/)                     |
| :------------: | :-------------------------------------------------------------------------: |
|   AUR Helper   |                     [yay](https://github.com/Jguer/yay)                     |
|     Shell      |                       [Fish](https://fishshell.com/)                        |
| Window Manager |                [BSPWM](https://github.com/baskerville/bspwm)                |
|      Bar       |                [Polybar](https://github.com/polybar/polybar)                |
|      Menu      |                 [Rofi](https://github.com/davatorium/rofi)                  |
|   Compositor   |      [Picom Jonaburg](https://github.com/Arian8j2/picom-jonaburg-fix)       |
|    Terminal    |                [Kitty](https://github.com/kovidgoyal/kitty)                 |
|  File Manager  |        [Thunar](https://archlinux.org/packages/extra/x86_64/thunar)         |
|    Browser     |      [Chromium](https://archlinux.org/packages/extra/x86_64/chromium)       |
|  Text Editor   | [VS Code / nano](https://aur.archlinux.org/packages/visual-studio-code-bin) |
|     Theme      |             [Tokyo Night](https://www.gnome-look.org/p/1681315)             |
|     Icons      |         [Tokyo Night](https://github.com/ljmill/tokyo-night-icons)          |

## Installation

### AUR Helper

The initial installation of Yay

```sh
pacman -S --needed nano git base-devel && git clone https://aur.archlinux.org/yay.git && cd yay && makepkg -si
```

**MAKEPKG**

Speed up compiling of AUR packages

```sh
sudo nano /etc/makepkg.conf

MAKEFLAGS="-j8"
```

**Pacman setting-up**

Parallel downloading of packages

```sh
sudo nano /etc/pacman.conf

ParallelDownloads = 5
```

---

**Installing packages**

> Assuming your **AUR Helper** is [yay](https://github.com/Jguer/yay).

```sh
yay -S --needed xorg xorg-xinit \
bspwm sxhkd polybar feh kitty fish rofi sddm sddm-theme-tokyo-night \
blueman bluez bluez-utils networkmanager dhcpcd \
acpid brightnessctl sof-firmware \
mesa mesa-utils lib32-mesa vulkan-intel lib32-vulkan-intel vulkan-icd-loader lib32-vulkan-icd-loader \
tumbler thunar maim xdotool xclip lxappearance-gtk3 xdg-user-dirs \
visual-studio-code-bin nano \
mpv vlc ffmpeg ffmpegthumbnailer obs-studio \
telegram-desktop qbittorrent discord \
p7zip unrar unzip gparted \
fastfetch btop \
chromium \
gnu-free-fonts ttf-hack-nerd noto-fonts noto-fonts-emoji noto-fonts-cjk \
&& fc-cache -fv
```

**Installing Picom Jonaburg fork**

```sh
git clone https://github.com/jonaburg/picom
cd picom
meson --buildtype=release . build
ninja -C build
# To install the binaries in /usr/local/bin (optional)
sudo ninja -C build install
```

**Copy configuration files**

```sh
# /.config
mkdir -p $HOME/.config && cp -r $HOME/arch_bspwm/config/* $HOME/.config
# /.local/bin
mkdir -p $HOME/.local/bin && cp -r $HOME/arch_bspwm/bin/* $HOME/.local/bin
# /etc
cp -r $HOME/arch_bspwm/etc/sddm.conf $HOME/etc

# Make executable
sudo chmod +x $HOME/.config/bspwm/bspwmrc
sudo chmod +x $HOME/.config/polybar/polybar.sh

# Wallpaper folder
mkdir -p $HOME/Pictures/Wallpaper && cp -r $HOME/arch_bspwm/misc/wall.jpg $HOME/Pictures/Wallpaper
```

**Daemons**

```sh
sudo systemctl enable sddm.service
sudo systemctl enable acpid.service
sudo systemctl enable bluetooth.service
sudo systemctl enable dhcpcd.service
sudo systemctl enable NetworkManager.service
```

---

### Xorg setting-up

**Adding language**

```sh
sudo nano /etc/locale.gen

ru_RU.UTF-8 UTF-8

sudo locale-gen
```

**Configure keyboard layout in Xorg**

```sh
sudo nano /etc/X11/xorg.conf.d/00-keyboard.conf


```

**Configure keyboard layout in tty**

```sh
sudo nano /etc/vconsole.conf

KEYMAP=us
XKBLAYOUT=us,ru
XKBMODEL=pc105+inet
XKBOPTIONS=grp:alt_shift_toggle
```

**Config touchpad (for Notebooks)**

```sh
sudo nano /etc/X11/xorg.conf.d/30-touchpad.conf

Section "InputClass"
    Identifier "touchpad"
    Driver "libinput"
    MatchIsTouchpad "on"
    Option "NaturalScrolling" "true"
    Option "Tapping" "on"
    Option "TappingButtonMap" "lmr"
EndSection
```

---

### Other

**Vencord (Discord)**

```sh
# bash
sh -c "$(curl -sS https://raw.githubusercontent.com/Vendicated/VencordInstaller/main/install.sh)"
```
