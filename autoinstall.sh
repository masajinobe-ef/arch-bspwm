pacman -S --needed --noconfirm nano git base-devel && cd $HOME
git clone https://aur.archlinux.org/yay.git && cd yay
makepkg -si

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
bluez bluez-utils sof-firmware \
&& fc-cache -fv

mkdir -p $HOME/.config && cp -r $HOME/arch_bspwm/config/* $HOME/.config
mkdir -p $HOME/.local/bin && cp -r $HOME/arch_bspwm/bin/* $HOME/.local/bin
cp -r $HOME/arch_bspwm/misc/* $HOME

chmod +x $HOME/.config/bspwm/bspwmrc
chmod +x $HOME/.config/polybar/polybar.sh

systemctl enable acpid.service
systemctl enable bluetooth.service

localectl --no-convert set-x11-keymap us,ru pc105+inet qwerty grp:alt_shift_toggle

xrdb -override $HOME/.Xresources